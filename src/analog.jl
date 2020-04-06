
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
                    task::DAQTask{AI}) where T <: RWTypes
    
    samples_read = Ref{Int32}()
    samples = length(dst)
    read_analog_fun[T](task.handle, samples, 1.0,
                       DAQmx.GroupByChannel, dst,
                       length(dst), samples_read) |> catch_error
    
    if Int32(samples) !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    return 
end

function Base.read(     task::DAQTask{AI},
                     samples::Int           =   1024,
                   precision::Type{T}       =   Float64) where T <: RWTypes

    data = readalloc(precision, task, samples)
    read!(data, task, samples)

    return reshape(data, samples, :)
end

function callback(handle::TaskHandle, event_type::Cint, num_samples::Cuint,
                  chart::ChartRoll)::Cint
    read!(chart.buffer, task)
    append!(result, buffer)
    return 0
end

function done_cb(handle::TaskHandle, status::Cint, cb_data::Ptr{Cvoid})::Cint
    catch_error(status)
    return 0
end

mutable struct ChartRoll
    result::Vector{Float64}
    buffer::Vector{Float64}
    function ChartRoll(task::DAQTask, sampling::Frequency, refresh::Frequency)
        samples_per_chan = cld(sampling, refresh)  # samples PER CHANNEL
        buffer = readalloc(task, samples) # Use readalloc here to account for
                                          # multi-channel reading
        DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                               DAQmx.ContSamps, samples_per_chan) |> catch_error
        return new(Float64[], buffer)
    end
end

mutable struct Sweep
    result::Vector{Float64}
    function Sweep(task::DAQTask, sampling::Frequency, duration::Float64)
        samples = round(Int, sampling * duration)
        DAQmx.CfgSampClkTiming(task.handle, "", sampling, DAQmx.Rising,
                               DAQmx.FiniteSamps, samples_per_chan) |> catch_error
        result = readalloc(task, samples)
        return new(result)
    end
end

function record(task::DAQTask{AI}, chart::ChartRoll)
    
    samples::Int64 =
    result = Float64[]
    buffer = NIDAQ.readalloc(task, samples)
    DAQmx.CfgSampClkTiming(task.handle, DAQmx.Rising, DAQmx.ContSamps, samples)

    
    return result
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


