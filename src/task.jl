
#= eventually a task type hierarchy
abstract type TaskType end
abstract type AnalogIn       <: TaskType end
abstract type AnalogOut      <: TaskType end
abstract type DigitalIn      <: TaskType end
abstract type DigitalOut     <: TaskType end
=#

struct DAQTask #TODO: create type hierarchy later
    name::String
    handle::TaskHandle

        function DAQTask(name::String)
            handle = TaskHandle()
            if DAQmx.CreateTask(name, Ref(handle)) !== DAQmx.Success
                throw("Something wrong.")
            else
                new(name, handle)
            end
        end
end

DAQTask() = DAQTask("")

#TODO: add start stop clear task

function start(t::DAQTask) end
function stop(t::DAQTask) end
function clear(t::DAQTask) end

#=
for (cfunction, jfunction) in (
        (DAQmxStartTask, :start),
        (DAQmxStopTask, :stop),
        (DAQmxClearTask, :clear))
    @eval function $jfunction(t::Task)
        catch_error( $cfunction(t.th) )
        nothing
    end

    @eval @doc $(string("`", jfunction, """(task)`

    """,jfunction," the specified NIDAQ task")) $jfunction
end
=#