
function update!(t::DAQTask)
end

function Base.push!(t::DAQTask, chan::DAQChannel; kwargs...)
end

function Base.push!(t::DAQTask, dev::DAQDevice; kwargs...)
end

function start(task::DAQTask)
    if DAQmx.StartTask(task.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        return println("Running $(t.name)...")
    end
end

function stop(task::DAQTask)
    if DAQmx.StopTask(task.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        return println("Stopped $(task.name)...")
    end
end

function clear(task::DAQTask)
    if DAQmx.ClearTask(task.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        task = nothing
        return
    end
end

