module NIDAQ

include("DAQmx/DAQmx.jl")

using .DAQmx
using PrettyTables, OrderedCollections, InteractiveUtils, OffsetArrays
using DataStructures, Distributed
import Base.write, Base.read!, Base.push!, Base.show

export DAQmx
export DAQDevice, DefaultDev, DAQTask, TaskChannel
export AnalogIn, AnalogOut, DigitalIn, DigitalOut, CounterIn, CounterOut
export AI, AO, DI, DO, CI, CO

export lsdev, lschan
export start, stop, clear, isrunning
export taskalloc, read!
export rate, maxrate
export record!

include("types.jl")
include("constructors.jl")
include("util.jl")
include("task.jl")
include("properties.jl")
include("analog.jl")
#include("digital.jl")
include("counter.jl")

const VERSION_SUPPORT = v"20.1.0"
global CLIENT_VERSION

const event_notify_c = Ref{Ptr{Cvoid}}(0)
const done_notify_c = Ref{Ptr{Cvoid}}(0)

function __init__()
    event_notify_c[] = @cfunction(event_notify, Cint,
                                  (TaskHandle, Cint, Cuint, Ptr{Cvoid}))
    done_notify_c[] = @cfunction(done_notify, Cint,
                                 (TaskHandle, Cint, Ptr{Cvoid}))
end

end
