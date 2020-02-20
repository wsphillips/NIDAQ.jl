module NIDAQ

include("DAQmx/DAQmx.jl")

using .DAQmx
using PrettyTables, OrderedCollections, InteractiveUtils, OffsetArrays
import Base.write, Base.read!, Base.push!, Base.show

export DAQmx
export DAQDevice, DefaultDev, DAQTask, TaskChannel
export AnalogIn, AnalogOut, DigitalIn, DigitalOut, CounterIn, CounterOut
export AI, AO, DI, DO, CI, CO
export lsdev, lschan
export start, stop, clear
export taskalloc, read!
include("types.jl")
include("util.jl")
include("task.jl")
include("properties.jl")
include("analog.jl")
#include("digital.jl")
#include("counter.jl")

const supported_version = v"19.5.0"

const hostver = version()

supported_version == hostver || @warn("Installed NIDAQmx version: v$hostver" *
                                      "is not officially supported. This may" *
                                      " result in undefined behavior/errors.")
end
