module NIDAQ

include("DAQmx/DAQmx.jl")

using .DAQmx
using PrettyTables, OrderedCollections, InteractiveUtils, OffsetArrays
import Base.write, Base.read, Base.push!, Base.show

export DAQmx
export DAQDevice, DefaultDev, DAQTask, TaskChannel
export AnalogIn, AnalogOut, DigitalIn, DigitalOut, CounterIn, CounterOut
export AI, AO, DI, DO, CI, CO
export lsdev, lschan
export start, stop, clear

include("types.jl")
include("util.jl")
include("task.jl")
include("properties.jl")

#include("analog.jl")
#include("digital.jl")
#include("counter.jl")

end
