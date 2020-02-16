
const ai_read_types = Union{Float64,Int16,Int32,UInt16,UInt32}

const read_analog_fun = LittleDict(
    Float64 => DAQmx.ReadAnalogF64,
    Int16   => DAQmx.ReadBinaryI16,
    Int32   => DAQmx.ReadBinaryI32,
    UInt16  => DAQmx.ReadBinaryU16,
    UInt32  => DAQmx.ReadBinaryU32)

function taskalloc(::Type{T},
                   task::DAQTask,
                   samples::Int = 1024) where T <: ai_read_types

    data = Vector{T}(undef, samples*length(task.channels))
end

taskalloc(task::DAQTask, samples::Int=1024) = taskalloc(Float64, task, samples)

function Base.read!(dst::Vector{T}, task::DAQTask,
               samples::Int = 1024) where T <: ai_read_types
    
    samples_read = Ref{Int32}()
    read_analog_fun[T](task.handle, Int32(samples), 1.0,
                       UInt32(DAQmx.GroupByChannel), dst,
                       UInt32(length(dst)), samples_read) |> catch_error
    
    if Int32(samples) !== samples_read[]
        @warn "Read samples($(samples_read[])) != requested samples($samples)"
    end

    return 
end

#=
        (WriteAnalogF64, Float64),
        (WriteBinaryI16, Int16),
        (WriteBinaryI32, Int32),
        (WriteBinaryU16, UInt16),
        (WriteBinaryU32, UInt32))
=#
