
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

const getchanfun = LittleDict(
    AI => DAQmx.GetDevAIPhysicalChans,
    AO => DAQmx.GetDevAOPhysicalChans,
    DI => DAQmx.GetDevDILines,
    DO => DAQmx.GetDevDOLines,
    CI => DAQmx.GetDevCIPhysicalChans,
    CO => DAQmx.GetDevCOPhysicalChans
)

struct DAQStringBuffer
     str::Vector{UInt8}
    size::UInt32
        function DAQStringBuffer(size = 256)
            str  = Vector{UInt8}(undef, size)
            size = UInt32(size)
            new(str,size)
        end
end

mutable struct DAQDevice
    name::String
    channels::Union{LittleDict,Nothing}
    
    function DAQDevice(name::String)
        x = new(name)
        chanobjs = lschan(x; asobjects=true)
        zipped = zip(keys(getchanfun),chanobjs)
        x.channels = LittleDict([kv for kv in zipped])
        return x
    end
end

#FIXME: atm we just return nothing
function Base.show(io::IO, dev::DAQDevice)
    #TODO: make a reasonable display of
    # DAQDevice so it doesn't look like garbagio
    return nothing
end


struct PhysicalChannel{T<:AbstractIO} <: DAQChannel
      name::String
    parent::DAQDevice
    ranges::Union{Vector{Tuple{Float64,Float64}},Nothing}
end

function Base.show(io::IO, chan::PhysicalChannel{T}) where T <: AbstractIO 
    println(io, "Channel name: ", chan.name)
    println(io, "Channel type: ", "$T")
    println(io, "Parent device: ", chan.parent.name)
    if chan.ranges !== nothing
        print(io, "Available ranges: ")
        for x in chan.ranges
            print(io, x, ", ")
        end
    end
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

