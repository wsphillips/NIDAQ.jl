function Base.show(io::IO, chan::PhysicalChannel{T}) where T <: AbstractIO 
    println(io, "Channel name: ", chan.name)
    println(io, "Channel type: ", "$T")
    println(io, "Parent device: ", chan.parent.name)
    if chan.ranges !== nothing
        print(io, "Available ranges: ")
        for x in chan.ranges
            print(io, x, ", ")
        end
    end
end

#FIXME: make a reasonable display of
# DAQDevice so it doesn't look like garbagio
function Base.show(io::IO, dev::DAQDevice)
    return nothing
end

function Base.append!(task::DAQTask, chan::TaskChannel{T}) where T <: AbstractIO
end

function Base.append!(task::DAQTask,
                      chan::PhysicalChannel{T},
                      name::String="",
                      tcfg::DAQmx.DAQmxConstant=DAQmx.Diff,
                      range::Tuple{Float64,Float64}=(-10.0,10.0),
                      units::DAQmx.DAQmxConstant=DAQmx.Volts,
                      scalename::String="") where T <: Union{AnalogIn,AnalogOut}

    ret = DAQmx.CreateAIVoltageChan(task.handle, chan.name, "", tcfg,
                                 range[1], range[2], units, scalename)
    if ret < 0
        println("$ret")
    else
        task.device = chan.parent
        if task.channels == nothing
            task.channels = [chan]
        else
            append!(task.channels, chan)
        end
    end
end


