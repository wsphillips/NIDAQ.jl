module NIDAQ

using Libdl

const daqmx_handle = Libdl.dlopen("libnidaqmx"; throw_error=false)

include("DAQmx/DAQmx.jl")

using .DAQmx
using PrettyTables, OrderedCollections, InteractiveUtils, OffsetArrays
using DataStructures, Distributed
import Base.write, Base.read!, Base.push!, Base.show

include("types.jl")

export DAQmx
export DAQDevice, DefaultDev, DAQTask, TaskChannel
export AnalogIn, AnalogOut, DigitalIn, DigitalOut, CounterIn, CounterOut
export AI, AO, DI, DO, CI, CO

if daqmx_handle !== nothing
    export lsdev, lschan
    export start, stop, clear
    export taskalloc, read!
    export rate, maxrate
    export record!

    include("constructors.jl")
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
else
    @warn("NIDAQmx not found, loading data types only.")
end

end
