
function update!(t::DAQTask)
    #synchronize Julia DAQTask to current properties
    #of the associated TaskHandle in C land
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
    if length(task.conditions) > 0
        while length(task.conditions) > 0
            x = pop!(task.conditions)
            ccall(:uv_async_send, Nothing, (Ptr{Nothing},), x)
            close(x)
        end
        println("Stopped $(task.name) and closed async conditions...")
    else
        println("Stopped $(task.name)...")
    end
    return
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

function refresh!(task::DAQTask)
    DAQmx.ClearTask(task.handle) |> catch_error
    # rebuild task from fields of DAQTask and replace TaskHandle
    return
end
