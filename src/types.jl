
abstract type AbstractIO end
abstract type AnalogIn   <: AbstractIO end
abstract type AnalogOut  <: AbstractIO end
abstract type DigitalIn  <: AbstractIO end
abstract type DigitalOut <: AbstractIO end
abstract type CounterIn  <: AbstractIO end
abstract type CounterOut <: AbstractIO end

abstract type DAQChannel end

# Type aliasing for convenience
const AI = AnalogIn
const AO = AnalogOut
const DI = DigitalIn
const DO = DigitalOut
const CI = CounterIn
const CO = CounterOut

struct DAQStringBuffer
     str::Vector{UInt8}
    size::UInt32
        function DAQStringBuffer(size = 256)
            str  = Vector{UInt8}(undef, size)
            size = UInt32(size)
            new(str,size)
        end
end

struct DAQDevice
    name::String
end

struct PhysicalChannel{T<:AbstractIO} <: DAQChannel
      name::String
    parent::DAQDevice
    ranges::Union{Vector{Tuple{Float64,Float64}},Nothing}
end

struct TaskChannel{T<:AbstractIO} <: DAQChannel
    name::String
    phys::PhysicalChannel
    attr::OrderedDict
end

mutable struct DAQTask
        name::String
      handle::TaskHandle
     devices::Union{LittleDict,Nothing}
    channels::Union{LittleDict,Nothing}

        function DAQTask(name::String)
            handleptr = Ref{TaskHandle}()
            if DAQmx.CreateTask(name, handleptr) !== DAQmx.Success
                throw("Something wrong.")
            else
                new(name, handleptr[], nothing, nothing)
            end
        end
end

DAQTask() = DAQTask("")

