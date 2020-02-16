
function Base.convert( ::Type{Vector{String}},
                      x::DAQStringBuffer)
    x.str[end] = 0
    strvec = split(unsafe_string(pointer(x.str)), ", "; keepempty=false)
    return String.(strvec)
end

function Base.convert(::Type{String}, x::DAQStringBuffer)
    x.str[end] = 0
    return unsafe_string(pointer(x.str))
end

function catch_error(code::Int32)
    code == DAQmx.Success && return
    
    buf = DAQStringBuffer(DAQmx.GetErrorString(code, Vector{UInt8}(),UInt32(0)))
    DAQmx.GetErrorString(code, buf.str, buf.size)

    code > Int32(0) && (@warn convert(String, buf); return)
    code < Int32(0) && throw(convert(String,buf))
end


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
                      chan::PhysicalChannel{T};
                      name::String                  = "",
                      tcfg::DAQmx.DAQmxConstant     = DAQmx.Diff,
                     range::Tuple{Float64,Float64}  = (-10.0,10.0),
                     units::DAQmx.DAQmxConstant     = DAQmx.Volts,
                 scalename::String                  = "") where T <: Union{AnalogIn,AnalogOut}

    DAQmx.CreateAIVoltageChan(task.handle, chan.name, "",
                              tcfg, range[1], range[2],
                              units, scalename) |> catch_error
    task.device = chan.parent
    if task.channels == nothing
        task.channels = [chan]
    else
        append!(task.channels, chan)
    end
end


