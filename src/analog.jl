# Convenience aliasing + function maps
const RWTypes = Union{Float64,Int16,Int32,UInt16,UInt32}
const Frequency = Union{Float64,Integer}

const read_analog_fun = IdDict(
    Float64 => DAQmx.ReadAnalogF64,
    Int16   => DAQmx.ReadBinaryI16,
    Int32   => DAQmx.ReadBinaryI32,
    UInt16  => DAQmx.ReadBinaryU16,
    UInt32  => DAQmx.ReadBinaryU32)

const write_analog_fun = IdDict(
    Float64 => DAQmx.WriteAnalogF64,
    Int16   => DAQmx.WriteBinaryI16,
    Int32   => DAQmx.WriteBinaryI32,
    UInt16  => DAQmx.WriteBinaryU16,
    UInt32  => DAQmx.WriteBinaryU32)

const AI_SIGNAL_EVENTS = (DAQmx.SampleClock,
                          DAQmx.SampleCompleteEvent,
                          DAQmx.ChangeDetectionEvent,
                          DAQmx.CounterOutputEvent)

function readalloc(task::DAQTask{AI},
                   samples::Int = 1024,
                   ::Type{T} = Float64) where T <: RWTypes
    return Array{T}(undef, length(task.channels), samples)
end

function Base.read!(handle::TaskHandle, samples_perchan::Integer, dst::AbstractArray{T}) where T <: RWTypes
    samples_read = Ref{Int32}()
    buffer_samples = length(dst)
    read_analog_fun[T](handle, samples_perchan, 1.0,
                       DAQmx.GroupByScanNumber, dst,
                       buffer_samples, samples_read) |> catch_error
    return nothing 
end

Base.read!(dst::AbstractArray{<:RWTypes}, task::DAQTask{AI}) = read!(task.handle, div(length(dst),length(task.channels)), dst)

function Base.read(task::DAQTask{AI}, samples::Int = 1024,
                   precision::Type{T} = Float64) where T <: RWTypes
    data = readalloc(task, samples, precision)
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

function event_notify(task_handle::TaskHandle, event_type::Cint, num_samples::Cuint,
                      data::Ptr{Nothing})::Cint
    ptr = convert(Ptr{DAQEventCB}, data)
    uvhandle = unsafe_load(ptr).uvhandle
    val = DAQEventCB(uvhandle, task_handle, event_type, num_samples)
    unsafe_store!(ptr, val)
    ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    return 0
end

function done_notify(task_handle::TaskHandle, status::Cint, data::Ptr{Nothing})::Cint
    if status !== Cint(0)
        ptr = convert(Ptr{DAQDoneCB}, data)
        uvhandle = unsafe_load(ptr).uvhandle
        val = DAQDoneCB(uvhandle, task_handle, status)
        unsafe_store!(ptr, val)
        ccall(:uv_async_send, Nothing, (Ptr{Nothing},), uvhandle)
    end
    return 0 
end

function clearevents!(task::DAQTask{AI})
    DAQmx.RegisterEveryNSamplesEvent(task.handle, DAQmx.Acquired_Into_Buffer,
                                     0, C_NULL, C_NULL) |> catch_error
    DAQmx.RegisterDoneEvent(task.handle, C_NULL, C_NULL) |> catch_error
    for event in AI_SIGNAL_EVENTS
        DAQmx.RegisterSignalEvent(task.handle, event, C_NULL, C_NULL) |> catch_error
    end
    return nothing
end

function start(task::DAQTask{AI}, callback::Function, samples_perchan::Integer, args...) 
    nsamplescb = Base.AsyncCondition()
    donecb = Base.AsyncCondition()
    num_channels = length(task.channels)
    filename = Dates.format(Dates.now(), "yyyy_mm_dd_HHMMSS") * "data.h5"
    logfile = h5open(filename, "w")
    # Here we are using Float64 but it should pull the type from the buffer data type
    A = create_dataset(logfile, "A", Float64, ((samples_perchan*num_channels,),(-1,)), chunk=(samples_perchan * num_channels,))
    
    GC.@preserve nsamplescb donecb task filename logfile A begin
        data_ref = Ref(DAQEventCB(Base.unsafe_convert(Ptr{Cvoid}, nsamplescb), C_NULL, 0, 0))
        status_ref = Ref(DAQDoneCB(Base.unsafe_convert(Ptr{Cvoid}, donecb), C_NULL, 0))
        clearevents!(task) # remove any stale callbacks
        DAQmx.RegisterEveryNSamplesEvent(task.handle, DAQmx.Acquired_Into_Buffer,
                                         samples_perchan, event_notify_c[], data_ref) |> catch_error
        DAQmx.RegisterDoneEvent(task.handle, done_notify_c[], status_ref) |> catch_error
    @async begin
        try
            start(task)
            @async while isrunning(task)
                Base.wait(donecb)
                catch_error(status_ref[].status)
                GC.safepoint()
            end
            while isrunning(task)
                Base.wait(nsamplescb)
                data = data_ref[]
                callback(data.task_handle, data.num_samples, A, args...)
                GC.safepoint()
            end
        catch
            rethrow()
        finally
            close(nsamplescb)
            close(donecb)
            close(logfile)
        end
    end
    end # GC preserve
    return nothing
end

function read_to_feed(handle::TaskHandle, num_samples::Integer, log, dst::AbstractArray, feed::Union{RemoteChannel,Channel})
    read!(handle, num_samples, dst)
    dims = HDF5.get_extent_dims(log)[1]
    new_dims = (dims[1]+length(dst),)
    HDF5.set_extent_dims(log, new_dims)
    log[(dims[1]+1):new_dims[1]] = dst
    put!(feed, dst)
    return
end

function record!(task::DAQTask{AI}, 
                 sampling::Frequency=20000, 
                 refresh::Frequency=50;
                 feed::Union{RemoteChannel,Channel})
    num_samples_perchan::Int64 = cld(sampling, refresh)
    buffer = readalloc(task, num_samples_perchan)
    num_channels = length(task.channels) 
    DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                          DAQmx.ContSamps, num_samples_perchan) |> catch_error 
    start(task, read_to_feed, num_samples_perchan, buffer, feed)
    return
end

# Write functions

function Base.write(handle::TaskHandle, samples_perchan::Integer, wave::AbstractArray{T}) where {T <: RWTypes}
    
    samples_written = Ref{Int32}()
    write_analog_fun[T](handle, samples_perchan, false,
                        1.0, DAQmx.GroupByScanNumber, wave,
                        samples_written) |> catch_error

    return samples_written[]
end

