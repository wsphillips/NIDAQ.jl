
abstract type DAQChannel end
abstract type AnalogIn   <: DAQChannel end
abstract type AnalogOut  <: DAQChannel end
abstract type DigitalIn  <: DAQChannel end
abstract type DigitalOut <: DAQChannel end
abstract type CounterIn  <: DAQChannel end
abstract type CounterOut <: DAQChannel end

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

struct PhysicalChannel{T<:DAQChannel}
      name::String
    parent::DAQDevice
    ranges::Union{Vector{Tuple{Float64,Float64}},Nothing}
end

struct TaskChannel{T<:DAQChannel}
    name::String
    port::PhysicalChannel
    attr::OrderedDict
end

mutable struct DAQTask
        name::String
      handle::TaskHandle
    channels::Union{FrozenLittleDict,Nothing}
     devices::Union{FrozenLittleDict,Nothing}

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

