
# Convenience aliasing + function maps
const RWTypes = Union{Float64,Int16,Int32,UInt16,UInt32}

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

function readalloc(::Type{T},
                   task::DAQTask{AI},
                   samples::Int = 1024) where T <: RWTypes

    return Vector{T}(undef, samples*length(task.channels))
end

readalloc(task::DAQTask{AI}, samples::Int=1024) = readalloc(Float64, task, samples)

function Base.read!(dst::Vector{T}, task::DAQTask{AI},
               samples::Int = 1024) where T <: RWTypes
    
    samples_read = Ref{Int32}()

    read_analog_fun[T](task.handle, samples, 1.0,
                       DAQmx.GroupByChannel, dst,
                       length(dst), samples_read) |> catch_error
    
    if Int32(samples) !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    return 
end

function Base.read(task::DAQTask{AI}, samples::Int = 1024, precision::Type{T}=Float64) where T <: RWTypes

    data = readalloc(precision, task, samples)
    read!(data, task, samples)

    return data
end

function Base.write(task::DAQTask{AO}, wave::Vector{T}) where T <: RWTypes
    
    samples = length(wave) ÷ length(task.channels)
    samples_written = Ref{Int32}()

    write_analog_fun[T](task.handle, samples, true,
                        1.0, DAQmx.GroupByChannel,
                        wave, samples_written) |> catch_error

    if Int32(samples) !== samples_written[]
        @warn "Written samples($(samples_written[])) != sent samples($samples)"
    end

    return
end

