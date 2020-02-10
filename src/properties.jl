
function Base.convert( ::Type{Vector{String}},
                      x::DAQStringBuffer)
    x.str[end] = 0
    strvec = split(unsafe_string(pointer(x.str)), ", "; keepempty=false)
    return String.(strvec)
end

function lsdev(; show::Bool=true)    
    buf = DAQStringBuffer(DAQmx.GetSysDevNames(Vector{UInt8}(), UInt32(0)))
    if DAQmx.GetSysDevNames(buf.str, buf.size) < 0 
        throw("something wrong.")
    else
        out = convert(Vector{String}, buf)
        show && (println.(out); return)
        return out
    end
end

DefaultDev() = DAQDevice(lsdev(show=false)[1])

const getchanfun = freeze(LittleDict(AI => DAQmx.GetDevAIPhysicalChans,
                                     AO => DAQmx.GetDevAOPhysicalChans,
                                     DI => DAQmx.GetDevDILines,
                                     DO => DAQmx.GetDevDOLines,
                                     CI => DAQmx.GetDevCIPhysicalChans,
                                     CO => DAQmx.GetDevCOPhysicalChans))

function lschan(chantype::Union{Type{<:DAQChannel},Nothing} = nothing,
                     dev::DAQDevice = DefaultDev();
                    show::Bool = true)
    
    numtypes = length(subtypes(DAQChannel))
    chantype_names = String.(Symbol.(subtypes(DAQChannel)))
    
    if chantype == nothing
        chans = Vector{Vector{String}}(undef, numtypes)
        for (i, key) in enumerate(keys(getchanfun))
            # Calling with null values returns buffer/string length
            buf = DAQStringBuffer(getchanfun[key](dev.name, Vector{UInt8}(), UInt32(0)))
            if getchanfun[key](dev.name, buf.str, buf.size) < 0
                throw("Something wrong.")
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
        buf = DAQStringBuffer(getchanfun[chantype](dev.name, Vector{UInt8}(), UInt32(0)))
        if getchanfun[chantype](dev.name, buf.str, buf.size) < 0
            throw("Something wrong.")
        else
            chans = convert(Vector{String}, buf)
        end
        show || return chans
        header = chantype_names[chantype .== subtypes(DAQChannel)]
        return pretty_table(chans, [header])
    end
end

function ranges(chantype::T,
                     dev::DAQDevice = DefaultDev()) where T <: DAQChannel

    chantype ∉ [AI, AO] && throw("Channel type must be AI or AO.")
    
    if chantype == AI
        sz = DAQmx.GetDevAIVoltageRngs(dev.name, Vector{Float64}(), UInt32(0))
        result = Vector{Float64}(undef, sz)
        if DAQmx.GetDevAIVoltageRngs(dev.name, result, UInt32(sz)) < 0 
            throw("Something wrong.")
        end
        pairs = Vector{Tuple{Float64,Float64}}(undef, sz>>1)
        for i in 1:length(pairs) 
            pairs[i] = (popfirst!(result),popfirst!(result))
        end
        return pairs
    elseif chantype == AO
        sz = DAQmx.GetDevAOVoltageRngs(dev.name, Vector{Float64}(), UInt32(0))
        result = Vector{Float64}(undef, sz)
        if DAQmx.GetDevAOVoltageRngs(dev.name, result, UInt32(sz)) < 0
            throw("Somthing wrong.")
        end
        pairs = Vector{Tuple{Float64,Float64}}(undef, sz>>1)
        for i in 1:length(pairs) 
            pairs[i] = (popfirst!(result),popfirst!(result))
        end
        return pairs
    end
end

#function info(channel::T) where T <: DAQChannel 
#end

#=
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
