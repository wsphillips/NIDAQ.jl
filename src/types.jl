
# daq io types
abstract type AbstractIO end
abstract type AnalogIn   <: AbstractIO end
abstract type AnalogOut  <: AbstractIO end
abstract type DigitalIn  <: AbstractIO end
abstract type DigitalOut <: AbstractIO end
abstract type CounterIn  <: AbstractIO end
abstract type CounterOut <: AbstractIO end

# node for channels, perhaps unneeded...
abstract type DAQChannel end

# type aliasing for convenience
const AI = AnalogIn
const AO = AnalogOut
const DI = DigitalIn
const DO = DigitalOut
const CI = CounterIn
const CO = CounterOut

const ChannelIndex = Union{Integer,UnitRange{<:Integer}}
const AnalogIO = Union{AnalogIn, AnalogOut}

# holds non-null-terminated strings (buffers)
struct DAQStringBuffer
     str::Vector{UInt8}
    size::UInt32
    
    function DAQStringBuffer(size = 256)
        str  = Vector{UInt8}(undef, size)
        size = UInt32(size)
        return new(str,size)
    end
end

mutable struct DAQDevice
        name::String
    channels::Union{LittleDict,Nothing}
end

struct PhysicalChannel{T<:AbstractIO} <: DAQChannel
      name::String
    parent::DAQDevice
    ranges::Union{Vector{Tuple{Float64,Float64}},Nothing}
end

# This hasn't been implemented yet, but will act as a
# wrapper for a virtual channel that holds the underlying
# physical channel information, named alias of the virtual
# channel, and an in-memory dictionary of its attributes.
mutable struct TaskChannel{T<:AbstractIO} <: DAQChannel
     alias::String
      phys::PhysicalChannel
      attr::OrderedDict
    function TaskChannel{<:AbstractIO}(alias::String, 
                                       pchan::PhysicalChannel)    
        return new(alias, pchan, OrderedDict())
    end
end

mutable struct DAQTask{T<:AbstractIO}
        name::String
      handle::TaskHandle
      device::Union{DAQDevice,Nothing}
    channels::Union{Vector{PhysicalChannel{T}},Nothing}
    conditions::Vector{Base.AsyncCondition}
end

