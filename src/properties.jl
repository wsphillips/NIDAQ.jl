
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

function lschan(iotype::Union{Type{<:AbstractIO},Nothing} = nothing,
                     dev::DAQDevice = DefaultDev();
                    show::Bool = true)
    
    numtypes = length(subtypes(AbstractIO))
    iotype_names = String.(Symbol.(subtypes(AbstractIO)))
    
    if iotype == nothing
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
        return pretty_table(chandata, iotype_names)
    else
        buf = DAQStringBuffer(getchanfun[iotype](dev.name, Vector{UInt8}(), UInt32(0)))
        if getchanfun[iotype](dev.name, buf.str, buf.size) < 0
            throw("Something wrong.")
        else
            chans = convert(Vector{String}, buf)
        end
        show || return chans
        header = iotype_names[iotype .== subtypes(AbstractIO)]
        return pretty_table(chans, header)
    end
end

function ranges(iotype::Type{T},
                     dev::DAQDevice = DefaultDev()) where T <: AbstractIO

    iotype ∉ [AI, AO] && return nothing
    
    if iotype == AI
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
    elseif iotype == AO
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

function lschan(dev::DAQDevice; asobjects = true)
    allchans = lschan(nothing, dev; show = false)
    chanobjs = Vector{Vector{PhysicalChannel{<:AbstractIO}}}(undef, length(keys(getchanfun)))
    alltypes = collect(keys(getchanfun))
    for (i, chanvec) in enumerate(allchans)
        t  = alltypes[i]      
        chanobjs[i] = [PhysicalChannel{t}(x,dev,ranges(t,dev)) for x in chanvec]
    end
    return chanobjs
end

# Sort the property functions first

function Base.startswith(sym::Symbol, x)
    return startswith(String(sym), x)
end

function parse_symbols()
    
    get_prefixes = ["AI","AO","DI","DO","CI","CO","Sys","Dev","Task"]
    set_prefixes = get_prefixes[1:end-3]

    all_symbols = names(DAQmx, all=true)

    get_functions = all_symbols[startswith.(all_symbols,"Get")]
    set_functions = all_symbols[startswith.(all_symbols,"Set")]

    get_function_map = Dict(x => Vector{Function}() for x in get_prefixes)
    set_function_map = Dict(x => Vector{Function}() for x in set_prefixes)
    
    for getkey in get_prefixes
        get_subset = getfield.([DAQmx], get_functions[startswith.(get_functions,"Get$getkey")])
        get_function_map[getkey] = get_subset
    end

    for setkey in set_prefixes
        set_subset = getfield.([DAQmx], set_functions[startswith.(set_functions,"Set$setkey")])
        set_function_map[setkey] = set_subset
    end
    
    return (get_function_map, set_function_map)
end

const (get_function_map, set_function_map) = parse_symbols()

"""
`channel_type(task,channel) -> channel_type, measurement/output_type`
    GetChanType(channel.parent, channel.name, val1)
"""
function info(channel::TaskChannel{T}) where T
    
    val = Int32(0)
    if T == AI
        GetAIMeasType(channel.parent, channel.name, val)
    elseif T == AO
        GetAOOutputType(channel.parent, channel.name, val)
    elseif T ∈ [DI, DO]
        return (T, nothing)
    elseif T == CI
        GetCIMeasType(channel.parent, channel.name, val)
    elseif T == CO
        GetCOOutputType(channel.parent, channel.name, val)
    end

    return (T, val)
end

function argtypes(fun::Function)
    a = methods(fun).ms[1] # DAQmx wrappers have only one method
    return fieldtypes(a.sig)[2:end] # and at least one argument!
end

# Get function for dev, sys, task, channel
# channel properties
function getproperties(channel::TaskChannel{T}; warning=false) where T

    for f in get_function_map[string(T)]
        fun_argtypes = argtypes(f)
    end

    return
end

# system properties
function getproperties(; warning=false)

    for f in get_function_map["Sys"]
    end

    return
end

# device properties
function getproperties(dev::DAQDevice; warning=false)

    for f in get_function_map["Dev"]
    end

    return
end

# task properties
function getproperties(task::DAQTask; warning=false)

    for f in get_function_map["Task"]
    end

    return
end

# set properties (maybe split this up)
function setproperty!(t::DAQTask, channel::T, property::String, value) where T <: DAQChannel
    for f in set_function_map[]
    end

    return
end


