
function Base.convert( ::Type{Vector{String}},
                      x::DAQStringBuffer)
    length(x.str) == 0 && return nothing 
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
    code > 0 && (@warn convert(String, buf); return)
    code < 0 && throw(convert(String, buf))
end

function version()
    major, minor, update = Ref{UInt32}(), Ref{UInt32}(), Ref{UInt32}()
    DAQmx.GetSysNIDAQMajorVersion(major) |> catch_error
    DAQmx.GetSysNIDAQMinorVersion(minor) |> catch_error
    DAQmx.GetSysNIDAQUpdateVersion(update) |> catch_error
    major, minor, update = Int(major[]), Int(minor[]), Int(update[])
    return VersionNumber(major,minor,update)
end

function Base.show(io::IO, chan::PhysicalChannel{T}) where T <: AbstractIO 
    println(io, "Channel name: ", chan.name)
    println(io, "Channel type: ", "$T")
    println(io, "Parent device: ", chan.parent.name)
    if chan.ranges !== nothing
        print(io, "Available ranges: ")
        for x in chan.ranges
            print(io, x, " ")
        end
    end
end

#FIXME: make a pretty print display for devices
function Base.show(io::IO, dev::DAQDevice)
    return nothing
end

function Base.push!(task::DAQTask{AI},
                      chan::PhysicalChannel{AI};
                     alias::String                  = "",
                      tcfg::DAQmx.DAQmxConstant     = DAQmx.Diff,
                     range::Tuple{Float64,Float64}  = (-10.0,10.0),
                     units::DAQmx.DAQmxConstant     = DAQmx.Volts,
                 scalename::String                  = "")
    #NOTE: TaskChannel not implemented yet--will simplify this...
    if (task.channels !== nothing && chan ∈ task.channels)
        return @warn "Channel $(chan.name) already appended to task."
    end
    DAQmx.CreateAIVoltageChan(task.handle, chan.name, alias,
                              tcfg, range[1], range[2],
                              units, scalename) |> catch_error
    task.device === nothing && (task.device = chan.parent)
    task.channels === nothing && (task.channels = [chan]; return)
    push!(task.channels, chan)
    return 
end

function Base.push!(task::DAQTask{AI}, index::ChannelIndex, dev::DAQDevice=DefaultDev())
    if any(index .< 1)
        @error "Channel index not in valid range"
        return nothing
    end
    new_channels = dev.channels[AI][index]
    !isa(new_channels, Vector) && (push!(task, new_channels); return)
    for chan in new_channels
        push!(task, chan)
    end
end

