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
#include("counter.jl")

const VERSION_SUPPORT = v"20.1.0"
global CLIENT_VERSION

#=
function __init__()
    global CLIENT_VERSION = version()

    VERSION_SUPPORT == CLIENT_VERSION || @warn("Installed NIDAQmx version: v$hostver is not " *
                                               "officially supported. This may result in " *
                                               "undefined behavior/errors/segfaults.")
end
=#
end
