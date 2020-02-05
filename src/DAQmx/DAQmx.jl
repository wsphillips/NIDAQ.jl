module DAQmx

const TaskHandle = Ptr{Cvoid}
const CalHandle = Cuint

struct CVITime
    lsb::Culonglong
    msb::Clonglong
end

struct CVIAbsoluteTime
    cviTime::CVITime
end

include("libdaqmx_common.jl")
include("libdaqmx_api.jl")

abstract type TaskType end
abstract type AnalogInput       <: TaskType end
abstract type AnalogOutput      <: TaskType end
abstract type DigitalInput      <: TaskType end
abstract type DigitalOutput     <: TaskType end

struct DAQmxTask{T} where T <: TaskType
    handle::TaskHandle
end



end # module DAQmx

