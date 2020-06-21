module DAQmx

export TaskHandle
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

include(joinpath(@__DIR__,"libdaqmx_common.jl"))
include(joinpath(@__DIR__,"libdaqmx_api.jl"))

end # module DAQmx

