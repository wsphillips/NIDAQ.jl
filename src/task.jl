
#= eventually a task type hierarchy
abstract type TaskType end
abstract type AnalogIn       <: TaskType end
abstract type AnalogOut      <: TaskType end
abstract type DigitalIn      <: TaskType end
abstract type DigitalOut     <: TaskType end
=#



#TODO: add real error checking/message retrieval

mutable struct DAQTask #TODO: create type hierarchy later
    name::String
    handle::TaskHandle
    channels::LittleDict{String, TaskChannel{T<:ChannelType}}
    devices::LittleDict{String, DAQDevice}

        function DAQTask(name::String)
            handleptr = Ref{TaskHandle}()
            if DAQmx.CreateTask(name, handleptr) !== DAQmx.Success
                throw("Something wrong.")
            else
                new(name, handleptr[])
            end
        end
end

DAQTask() = DAQTask("")

# start, stop, & clear task

function start(t::DAQTask)
    if DAQmx.StartTask(t.handle) !== DAQmx.Success
        throw("something wrong.")
    else
        return nothing
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
        return nothing
    end
end

