# Channel get function lookups
const getchanfun = LittleDict(
    AI => DAQmx.GetDevAIPhysicalChans,
    AO => DAQmx.GetDevAOPhysicalChans,
    DI => DAQmx.GetDevDILines,
    DO => DAQmx.GetDevDOLines,
    CI => DAQmx.GetDevCIPhysicalChans,
    CO => DAQmx.GetDevCOPhysicalChans)

function DAQDevice(name::String)
    x = DAQDevice(name, nothing)
    chanobjs = lschan(x; asobjects=true)
    zipped = zip(keys(getchanfun),chanobjs)
    x.channels = LittleDict([kv for kv in zipped])
    return x
end

function DAQTask{T}(name::String) where T <: AbstractIO
    handleptr = Ref{TaskHandle}()
    DAQmx.CreateTask(name, handleptr) |> catch_error
    return DAQTask{T}(name, handleptr[], nothing, nothing)
end

DAQTask{T}() where T <: AbstractIO = DAQTask{T}("")
