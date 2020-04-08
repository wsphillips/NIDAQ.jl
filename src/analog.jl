
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

function recordcallback(handle::NIDAQ.TaskHandle, event_type::Cint,
                        num_samples::Cuint, data::Ptr{Cvoid})::Cint
    println("ping") 
       return
end

function donecallback(handle::NIDAQ.TaskHandle, status::Cint, data::Ptr{Cvoid})::Cint
    catch_error(status)
    return
end

const recordcallback_c = @cfunction(recordcallback, Cint, (NIDAQ.TaskHandle, Cint, Cuint, Ptr{Cvoid}))
const donecallback_c = @cfunction(donecallback, Cint, (NIDAQ.TaskHandle, Cint, Ptr{Cvoid}))

function recording(task::DAQTask{AI}, sampling::Frequency=20000, refresh::Frequency=60)
        
    
    num_samples::Int64 = cld(sampling, refresh)
    DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                          DAQmx.ContSamps, num_samples) |> catch_error 
    
    data = C_NULL #optional data arg
    DAQmx.RegisterEveryNSamplesEvent(task.handle, DAQmx.Acquired_Into_Buffer,
                                     num_samples, recordcallback_c, data) |> catch_error
    DAQmx.RegisterDoneEvent(task.handle, donecallback_c, data) |> catch_error
    
    start(task) # callbacks in use once task starts
    sleep(3.0) # segfaulting (Julia core dump) instantly
    stop(task)
    println("ok")

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

