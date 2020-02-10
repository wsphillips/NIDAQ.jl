
function update!(t::DAQtask)
end

function push!(t::DAQTask, chan::DAQChannel; kwargs...)
end

function push!(t::DAQTask, dev::DAQDevice; kwargs...)
end

function start(t::DAQTask)
    if DAQmx.StartTask(t.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        return println("Running $(t.name)...")
    end
end

function stop(t::DAQTask)
    if DAQmx.StopTask(t.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        return nothing
    end
end

function clear(t::DAQTask)
    if DAQmx.ClearTask(t.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        t = nothing
        return
    end
end

