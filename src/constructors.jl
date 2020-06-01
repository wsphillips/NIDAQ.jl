function DAQDevice(name::String)
    x = DAQDevice(name)
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
