
function update!(t::DAQTask)
end

function Base.push!(t::DAQTask, chan::DAQChannel; kwargs...)
end

function Base.push!(t::DAQTask, dev::DAQDevice; kwargs...)
end

function start(task::DAQTask)
    DAQmx.StartTask(task.handle) |> catch_error
    return println("Running $(task.name)...")
end

function stop(task::DAQTask)
    DAQmx.StopTask(task.handle) |> catch_error
    return println("Stopped $(task.name)...")
end

function clear(task::DAQTask)
    DAQmx.ClearTask(task.handle) |> catch_error
    task = nothing
    return
end

function isrunning(task::DAQTask)
    istaskdone = Ref{UInt32}()
    DAQmx.IsTaskDone(task.handle, istaskdone) |> catch_error
    return !(Bool(istaskdone[]))
end
