using PrettyTables, OrderedCollections
export DAQDevice, lsdev, DefaultDev, ChannelTypes, lschan
export AI, AO, DI, DO, CI, CO

struct DAQStringBuffer
    str::Vector{UInt8}
    size::UInt32
        function DAQStringBuffer(size::Int = 256)
            str = Vector{UInt8}(undef, size)
            size = UInt32(size)
            new(str,size)
        end
end

function Base.convert( ::Type{Vector{String}},
                      x::DAQStringBuffer)
    x.str[end] = 0
    strvec = split(unsafe_string(pointer(x.str)), ", "; keepempty=false)
    return String.(strvec)
end

struct DAQDevice
    name::String
end

function lsdev(; show::Bool=true)
    buf = DAQStringBuffer()
    if DAQmx.GetSysDevNames(buf.str, buf.size) < 0 
        throw("something wrong.")
    else
        out = convert(Vector{String}, buf)
        if show
            println.(out)
            return
        else 
            return out
        end
    end
end

DefaultDev() = DAQDevice(lsdev(show=false)[1])

@enum ChannelTypes begin
    ALL = 0
    AI  = 1
    AO  = 2
    DI  = 3
    DO  = 4
    CI  = 5
    CO  = 6
end

const chantype_names = ["Analog Input",
                        "Analog Output",
                        "Digital Input",
                        "Digital Output",
                        "Counter Input",
                        "Counter Output"]

const getchanfun = LittleDict(AI => DAQmx.GetDevAIPhysicalChans,
                              AO => DAQmx.GetDevAOPhysicalChans,
                              DI => DAQmx.GetDevDILines,
                              DO => DAQmx.GetDevDOLines,
                              CI => DAQmx.GetDevCIPhysicalChans,
                              CO => DAQmx.GetDevCOPhysicalChans)

function lschan(chantype::ChannelTypes = ALL,
                     dev::DAQDevice    = DefaultDev();
                    show::Bool         = true)
    numtypes = length(chantype_names)
    if chantype == ALL
        chans = Vector{Vector{String}}(undef, numtypes)
        for (i, key) in enumerate(keys(getchanfun))
            buf = DAQStringBuffer()
            if getchanfun[key](dev.name, buf.str, buf.size) < 0
                chans[i] = [""]
            else
                chans[i] = convert(Vector{String}, buf)
            end
        end
        show || return chans
        chandata = fill("", maximum(length.(chans)), numtypes)
        for (j, chan) in enumerate(chans)
            chandata[1:length(chan), j] = chan
        end
        return pretty_table(chandata, chantype_names)
    else
        buf = DAQStringBuffer()
        if getchanfun[chantype](dev.name, buf.str, buf.size) < 0
            return nothing
        else
            chans = convert(Vector{String}, buf)
        end
        show || return chans
        return pretty_table(chans, [chantype_names[Int(chantype)]])
    end
end

function ranges(chantype::ChannelTypes)
    chantype ∉ [AI, AO] && throw("Channel type must be AI or AO.")

    if chantype == AI
        # foo
    else
        #chan type AO
    end
end

#=
for (jfunction, cfunction) in (
        (:analog_input_ranges, GetDevAIVoltageRngs),
        (:analog_output_ranges, GetDevAOVoltageRngs))
    @eval function $jfunction(device::String)
        sz = $cfunction(Ref(codeunits(device),1), convert(Ptr{Float64},C_NULL), UInt32(0))
        data=zeros(sz)
        catch_error( $cfunction(Ref(codeunits(device),1), Ref(data,1),
                UInt32(sz)) )
        reshape(data,(2,length(data)>>1))'
    end

"""
`channel_type(task,channel) -> channel_type, measurement/output_type`

get the type of the specified NIDAQ channel
"""


function channel_type(t::Task, channel::String)
    val1 = Cint[0]
    catch_error(
        GetChanType(t.th, Ref(codeunits(channel),1), Ref(val1,1)) )

    val2 = Cint[0]
    if val1[1] == Val_AI
        ret = GetAIMeasType(t.th, Ref(codeunits(channel),1), Ref(val2,1))
    elseif val1[1] == Val_AO
        ret = GetAOOutputType(t.th, Ref(codeunits(channel),1), Ref(val2,1))
    elseif val1[1] == Val_DI || val1[1] == Val_DO
        return val1[1], nothing
    elseif val1[1] == Val_CI
        ret = GetCIMeasType(t.th, Ref(codeunits(channel),1), Ref(val2,1))
    elseif val1[1] == Val_CO
        ret = GetCOOutputType(t.th, Ref(codeunits(channel),1), Ref(val2,1))
    end
    catch_error(ret)

    val1[1], val2[1]
end

function _getproperties(args, suffix::String, warning::Bool)
    ret_val = Dict{String,Tuple{Any,Bool}}()
    local settable
    local data
    local ret
    for sym in names(NIDAQ, all=true)
        eval(:(!(typeof(NIDAQ.$sym) <:Function))) && continue
        if string(sym)[1:min(end,8+length(suffix))]=="DAQmxGet"*suffix
            cfunction = getfield(NIDAQ, sym)
	    ccall_args = code_lowered(cfunction)[1].code[end-1].args[3]
            try
                basetype = eltype(ccall_args[1+length(args)])
                if length(ccall_args)==1+length(args)
                    data = Ref{basetype}(0)
                    ret = cfunction(args..., data)
                    data = data[]
                else
                    sz = cfunction(args..., convert(Ptr{basetype},C_NULL), convert(UInt32,0))
                    if sz<0
                      ret=sz
                      throw()
                    end
                    data = zeros(basetype,sz)
                    ret = cfunction(args..., Ref(data,1), convert(UInt32,sz))
                end
                if ret!=0
                    throw()
                elseif basetype == Bool32
                    data = reinterpret(UInt32, data) != 0
                elseif basetype == Int32
                    try
                        data = map((x)->signed_constants[x], data)
                    catch
                    end
                elseif basetype == UInt32
                    try
                        data = map((x)->unsigned_constants[x], data)
                    catch
                    end
                elseif basetype == UInt8
                    data = split(safechop(ascii(String(data))),", ")

                end
            catch
                if warning
                    if ret!=0
                        catch_error(ret, string(cfunction)*": ", err_fcn=x->@warn(x))
                    else
                        @warn("can't handle function signature for $cfunction: $ccall_args")
                    end
                end
                continue
            end
            try
                getfield(NIDAQ, Symbol(replace(string(cfunction),"Get"*suffix =>"Set"*suffix)))
                settable=true
            catch
                settable=false
            end
            ret_val[string(cfunction)[15+length(suffix):end]] = (data, settable)
        end
    end
    ret_val
end

"""
`getproperties(warning=false) -> Dict`

get the NIDAQ system properties
"""
function getproperties(; warning=false)
    _getproperties((), "Sys", warning)
end

"""
`getproperties(device; warning=false) -> Dict`

get the properties of the specified NIDAQ device
"""
function getproperties(device::String; warning=false)
    _getproperties((Ref(codeunits(device),1),), "Dev", warning)
end

"""
`getproperties(task; warning=false) -> Dict`

get the properties of the specified NIDAQ task
"""
function getproperties(t::Task; warning=false)
    _getproperties((t.th,), "Task", warning)
end

channel_types = ["Val_AI", "Val_AO",
                 "Val_DI", "Val_DO",
                 "Val_CI", "Val_CO"]

"""
`getproperties(task,channel; warning=false) -> Dict`

get the properties of the specified NIDAQ channel
"""
function getproperties(t::Task, channel::String; warning=false)
    kind = channel_types[ findall(channel_type(t, channel)[1] .==
            map((x)->getfield(NIDAQ,Symbol(x)), channel_types))[1]][end-1:end]

    _getproperties((t.th, Ref(codeunits(channel),1)), kind, warning)
end

"""
`setproperty!(task,channel,property,value)`

set the specified NIDAQ property to value
"""
function setproperty!(t::Task, channel::String, property::String, value)
    kind = channel_types[ findall(channel_type(t, channel)[1] .==
            map((x)->getfield(NIDAQ,Symbol(x)), channel_types))[1]][end-1:end]

    @eval ret = $(Symbol("DAQmxSet"*kind*property))($t.th, Ref(codeunits($channel),1), $value)
    catch_error(ret, "DAQmxSet$kind$property: ")
    nothing
end

=#
