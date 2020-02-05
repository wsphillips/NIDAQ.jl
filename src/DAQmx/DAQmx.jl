module DAQmx

export TaskHandle
cd("DAQmx")
using CEnum

const Success = Cint(0)
const TaskHandle = Ptr{Cvoid}
const CalHandle = Cuint
const EveryNSamplesEventCallbackPtr = Ptr{Cvoid}
const DoneEventCallbackPtr = Ptr{Cvoid}
const SignalEventCallbackPtr = Ptr{Cvoid}

struct CVITime
    lsb::Culonglong
    msb::Clonglong
end

struct CVIAbsoluteTime
    cviTime::CVITime
end

include("libdaqmx_common.jl")
include("libdaqmx_api.jl")

end # module DAQmx

