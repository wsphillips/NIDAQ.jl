
# import DAQmx: GroupByChannel, CfgSampClkTiming, Rising, ContSamps, FiniteSamps

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

function readalloc(::Type{T}, task::DAQTask{AI},
                   samples::Int = 1024) where T <: RWTypes
    return Vector{T}(undef, samples*length(task.channels))
end

readalloc(task::DAQTask{AI},
          samples::Int=1024) = readalloc(Float64, task, samples)

function Base.read!( dst::Vector{T},
                    task::DAQTask{AI})::Nothing where T <: RWTypes
    
    samples_read = Ref{Int32}()
    samples = length(dst)
    read_analog_fun[T](task.handle, samples, 1.0,
                       DAQmx.GroupByChannel, dst,
                       length(dst), samples_read) |> catch_error
    
    if Int32(samples) !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    return nothing 
end

function Base.read(     task::DAQTask{AI},
                     samples::Int           =   1024,
                   precision::Type{T}       =   Float64) where T <: RWTypes

    data = readalloc(precision, task, samples)
    read!(data, task, samples)

    return reshape(data, samples, :)
end

struct _NIDAQEventCB
    uvhandle::Ptr{Nothing}
    task_handle::TaskHandle
    event_type::Cint
    num_samples::Cuint
end

struct _NIDAQDoneCB
    uvhandle::Ptr{Nothing}
    task_handle::TaskHandle
    status::Cint
end

function event_notify(task_handle::TaskHandle, event_type::Cint, num_samples::Cuint, data::Ptr{Nothing})::Cint
    
    ptr = convert(Ptr{_NIDAQEventCB}, data)
    uvhandle = unsafe_load(ptr).uvhandle

    val = _NIDAQEventCB(uvhandle, task_handle, event_type, num_samples)
    unsafe_store!(ptr, val)
    
    ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    return 0
end

function done_notify(task_handle::TaskHandle, status::Cint, data::Ptr{Nothing})::Cint
   #= 
    ptr = convert(Ptr{_NIDAQDoneCB}, data)
    uvhandle = unsafe_load(ptr).uvhandle
    val = _NIDAQDoneCB(uvhandle, task_handle, status)
    unsafe_store!(ptr, val)

    ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    =#
    return 0 
end

    
function recording(task::DAQTask{AI}, event_cb::Function, sampling::Frequency=20000, refresh::Frequency=60)
    
    num_samples::Int64 = cld(sampling, refresh)
    DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                          DAQmx.ContSamps, num_samples) |> catch_error 
    
    cb = Base.AsyncCondition()
    
    event_notify_c = @cfunction(event_notify, Cint, (TaskHandle, Cint, Cuint, Ptr{Cvoid}))
    done_notify_c = @cfunction(done_notify, Cint, (TaskHandle, Cint, Ptr{Cvoid}))

    GC.@preserve cb begin
    
        r_data = Ref(_NIDAQEventCB(Base.unsafe_convert(Ptr{Cvoid}, cb),C_NULL, 0,0))
        DAQmx.RegisterEveryNSamplesEvent(task.handle, DAQmx.Acquired_Into_Buffer,
                                         num_samples, event_notify_c, r_data) |> catch_error
        DAQmx.RegisterDoneEvent(task.handle, done_notify_c, C_NULL) |> catch_error
    
        @async begin
            try
                start(task)
                for j in 1:100 
                    Base.wait(cb)
                    #data = r_data[]
                    event_cb()
                end
            catch
                rethrow()
            finally
                stop(task)
                # need to reset the task as well
                # perhaps save config and reload here
                Base.close(cb)
            end
        end
    end
    return
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

    return
end

mutable struct Sweep
    result::Vector{Float64}
    function Sweep(task::DAQTask, sampling::Frequency, duration::Float64)
        samples_per_chan = round(Int, sampling * duration)
        DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                               DAQmx.FiniteSamps, samples_per_chan) |> catch_error
        result = readalloc(task, samples_per_chan)
        return new(result)
    end
end

mutable struct ChartRoll
    result::Vector{Float64}
    buffer::Vector{Float64}
    function ChartRoll(task::DAQTask, sampling::Frequency, refresh::Frequency)
        samples_per_chan::Int64 = cld(sampling, refresh)  # samples PER CHANNEL
        buffer = readalloc(task, samples_per_chan) # Use readalloc here to account for
                                          # multi-channel reading
        DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                               DAQmx.ContSamps, samples_per_chan) |> catch_error
        return new(Float64[], buffer)
    end
end

 #=buffer = Vector{Float64}(undef, Int(num_samples))
    read_analog_fun[Float64](handle, num_samples, 1.0,
                       DAQmx.GroupByChannel, buffer,
                       length(buffer), samples_read) |> catch_error
    
    if num_samples !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    append!(data, buffer) =#

