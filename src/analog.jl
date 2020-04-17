# Convenience aliasing + function maps
const RWTypes = Union{Float64,Int16,Int32,UInt16,UInt32}
const Frequency = Union{Float64,Integer}

const read_analog_fun = LittleDict(
    Float64 => DAQmx.ReadAnalogF64,
    Int16   => DAQmx.ReadBinaryI16,
    Int32   => DAQmx.ReadBinaryI32,
    UInt16  => DAQmx.ReadBinaryU16,
    UInt32  => DAQmx.ReadBinaryU32)

const write_analog_fun = LittleDict(
          Float64 => DAQmx.WriteAnalogF64,
          Int16   => DAQmx.WriteBinaryI16,
          Int32   => DAQmx.WriteBinaryI32,
          UInt16  => DAQmx.WriteBinaryU16,
          UInt32  => DAQmx.WriteBinaryU32)

function readalloc(task::DAQTask{AI},
                   samples::Int = 1024,
                   ::Type{T} = Float64) where T <: RWTypes
    return Vector{T}(undef, samples*length(task.channels))
end

function Base.read!(dst::Vector{T},
                    handle::TaskHandle) where T <: RWTypes
    
    samples_read = Ref{Int32}()
    samples::Cint = length(dst)
    read_analog_fun[T](handle, samples, 1.0,
                       DAQmx.GroupByScanNumber, dst,
                       samples, samples_read) |> catch_error
    
    if samples !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    return nothing 
end

read!(dst::Vector{<:RWTypes}, task::DAQTask) = read!(dst, task.handle)

function Base.read(task::DAQTask{AI}, samples::Int = 1024,
                   precision::Type{T} = Float64) where T <: RWTypes
    data = readalloc(precision, task, samples)
    read!(data, task)
    return data
end

struct DAQEventCB
    uvhandle::Ptr{Cvoid}
    task_handle::TaskHandle
    event_type::Cint
    num_samples::Cuint
end

struct DAQDoneCB
    uvhandle::Ptr{Cvoid}
    task_handle::TaskHandle
    status::Cint
end

function event_notify(task_handle::TaskHandle, event_type::Cint,
                      num_samples::Cuint, data::Ptr{Nothing})::Cint
    ptr = convert(Ptr{DAQEventCB}, data)
    uvhandle = unsafe_load(ptr).uvhandle
    val = DAQEventCB(uvhandle, task_handle, event_type, num_samples)
    unsafe_store!(ptr, val)
    ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    return 0
end

function done_notify(task_handle::TaskHandle, status::Cint,
                     data::Ptr{Nothing})::Cint
    if status !== Cint(0)
        ptr = convert(Ptr{DAQDoneCB}, data)
        uvhandle = unsafe_load(ptr).uvhandle
        val = DAQDoneCB(uvhandle, task_handle, status)
        unsafe_store!(ptr, val)
        ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    end
    return 0 
end

function clearevents!(handle::TaskHandle)
    DAQmx.RegisterEveryNSamplesEvent(handle, DAQmx.Acquired_Into_Buffer,
                                     0, C_NULL, C_NULL) |> catch_error
    DAQmx.RegisterDoneEvent(handle, C_NULL, C_NULL) |> catch_error
    DAQmx.RegisterSignalEvent(handle, DAQmx.SampleClock, C_NULL, C_NULL) |> catch_error
    return nothing
end

function record!(result::Vector{T},
                 task::DAQTask{AI}, 
                 sampling::Frequency=20000, 
                 refresh::Frequency=50;
                 remote::Union{RemoteChannel,Nothing} = nothing) where T <: RWTypes
    
    num_samples::Int64 = cld(sampling, refresh)
    buffer = readalloc(task, num_samples)
    
    DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                          DAQmx.ContSamps, num_samples) |> catch_error 
    
    cb1 = Base.AsyncCondition()
    cb2 = Base.AsyncCondition()

    event_notify_c = @cfunction(event_notify, Cint,
                                (TaskHandle, Cint, Cuint, Ptr{Cvoid}))
    done_notify_c = @cfunction(done_notify, Cint,
                               (TaskHandle, Cint, Ptr{Cvoid}))

    GC.@preserve cb1 cb2 task buffer event_notify_c done_notify_c begin
        
        r_data = Ref(DAQEventCB(Base.unsafe_convert(Ptr{Cvoid}, cb1),
                     C_NULL, 0, 0))
        r_return = Ref(DAQDoneCB(Base.unsafe_convert(Ptr{Cvoid}, cb2),
                       C_NULL, 0))

        clearevents!(task.handle) # remove any stale callbacks
        
        DAQmx.RegisterEveryNSamplesEvent(task.handle,
                                         DAQmx.Acquired_Into_Buffer,
                                         num_samples, event_notify_c,
                                         r_data) |> catch_error
        
        DAQmx.RegisterDoneEvent(task.handle, done_notify_c,
                                r_return) |> catch_error
        @async begin
            try
                start(task)
                
                @async begin
                    while isrunning(task)
                        Base.wait(cb2)
                        catch_error(r_return[].status)
                    end
                end
                
                while isrunning(task)
                    Base.wait(cb1)
                    data = r_data[]
                    read!(buffer, data.task_handle)
                    append!(result, buffer)
                    isnothing(remote) || put!(remote, buffer)
                end

            catch
                rethrow()
            finally
                Base.close(cb1)
                Base.close(cb2)
            end
        end

    end # GC preserve
    
    return nothing
end

# Write functions

function Base.write(task::DAQTask{AO},
                    wave::Vector{T}) where T <: RWTypes
    
    samples = length(wave) ÷ length(task.channels)
    samples_written = Ref{Int32}()

    write_analog_fun[T](task.handle, samples, true,
                        1.0, DAQmx.GroupByChannel, wave,
                        samples_written) |> catch_error

    if Int32(samples) !== samples_written[]
        @warn "Written samples($(samples_written[])) != sent samples($samples)"
    end

    return nothing
end

