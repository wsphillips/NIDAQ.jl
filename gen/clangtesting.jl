using Clang, Clang.LibClang
using CEnum
cd("/home/wikphi@ad.cmm.se/")
ctx = DefaultContext()

trans_unit = parse_header("NIDAQmx.h", args=["-fparse-all-comments"],
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "libnidaqmx"

push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
header = spelling(root_cursor)
ctx.children = children(root_cursor)

constants = Vector{CLMacroDefinition}()
attributes = Vector{CLMacroDefinition}()
topology = Vector{CLMacroDefinition}()
remaining = Vector{CLCursor}()

# Type aliasing map used by NIDAQmx.h
typedef_map = Dict([("int8", "Cchar"),
                    ("uInt8", "Cuchar"),
                    ("int16", "Cshort"),
                    ("uInt16", "Cushort"),
                    ("int32", "Cint"),
                    ("uInt32", "Cuint"),
                    ("float32", "Cfloat"),
                    ("float64", "Cdouble"),
                    ("int64", "Clonglong"),
                    ("uInt64", "Culonglong"),
                    ("bool32", "Cuint")
                   ])

attribute_map = Dict([("Buf", "Buffer"),
                    ("AI", "AIChannel"),
                    ("AO", "AOChannel"),
                    ("DI", "DIChannel"),
                    ("DO", "DOChannel"),
                    ("CI", "CIChannel"),
                    ("CO", "COChannel"),
                    ("Dev", "Device"),
                    ("Exported", "ExportedSignal"),
                    ("PersistedChan", "PersistedChannel"),
                    ("PersistedScale", "PersistedScale"),
                    ("PersistedTask", "PersistedTask"),
                    ("PhysicalChan", "PhysicalChannel"),
                    ("Read", "Read"),
                    ("Write", "Write"),
                    ("RealTime", "RealTime"),
                    ("Scale", "Scale"),
                    ("Task", "Task"),
                   ])

blacklist = ["unix","linux", "CVIDECL", "CVITime_DECLARED", "CVICDECL",
             "DAQmxSuccess", "DAQmx_ReadWaitMode",
             "CVIAbsoluteTime_DECLARED", "TRUE", "FALSE", "NULL", "DAQmxFailed",
             "CVICALLBACK"]

neg_constants = ["DAQmx_Val_Cfg_Default", "DAQmx_Val_Default", "DAQmx_Val_Auto"]

function wrap_macro2enum!(ctx::AbstractContext,
                          cursors::Vector{CLMacroDefinition}, constant_type::String)

    enum_sym = symbol_safe(constant_type)
    enum_type = Cint
    name2value = Tuple{Symbol,enum_type}[]
    # FIXME: extract values and names
    for cursor in cursors
        if constant_type == "DAQmxAttribute"
            # do check for sub-attribute types here...
            #if split(name(cursor), "_")[2] ∈ keys(attribute_map)
                
            item_name = spelling(cursor)[7:end]
        else
            item_name = spelling(cursor)[length("DAQmx_Val_")+1:end]
        end
        if startswith(item_name, r"[0-9]")
            item_name = "_" * item_name
        end
        item_sym = symbol_safe(item_name)
        tokens = tokenize(cursor)

        # Macros definitions include bitshift operators, which we have to check for...
        for i in 1:length(tokens)
            if typeof(tokens[i]) == Literal && (i == length(tokens) || tokens[i+1].text ∉ ["<<",">>"])
                push!(name2value, (item_sym, parse(enum_type, tokens[i].text)))
                break
            elseif typeof(tokens[i]) == Literal && i < length(tokens) && tokens[i+1].text ∈ ["<<",">>"]
                bitshift = prod(tokens[i:i+2]) 
                push!(name2value, (item_sym, eval(Meta.parse(bitshift)))) 
                break
            end
        end
    end

    expr = Expr(:macrocall, Symbol("@cenum"), nothing, Expr(:(::), enum_sym, enum_type))
    enum_pairs = Expr(:block)
    ctx.common_buffer[enum_sym] = ExprUnit(expr)

    for (name,value) in name2value
        push!(enum_pairs.args, :($name = $value))
    end

    push!(expr.args, enum_pairs)

    return ctx
end

function wrap_dealias!(ctx::AbstractContext, cursor::CLFunctionDecl)
    func_type = type(cursor)
    func_name = isempty(ctx.force_name) ? Symbol(spelling(cursor)) : ctx.force_name
    ret_type = :Cint 
    args = function_args(cursor)
    arg_types = [argtype(func_type, i) for i in 0:length(args)-1]
    arg_reps = clang2julia.(arg_types)

    for (i, arg) in enumerate(arg_reps)
        if isa(arg, Symbol)
            if String(arg) ∈ keys(typedef_map)
                arg_reps[i] = Symbol(typedef_map[String(arg)])
            end
        end
        if Meta.isexpr(arg, :curly) && first(arg.args) == :NTuple
            if String(last(arg.args)) ∈ keys(typedef_map)
                arg_reps[i] = Expr(:curly, :Ref, Symbol(typedef_map[String(last(arg.args))]))
            else
            arg_reps[i] = Expr(:curly, :Ref, last(arg.args))
            end
        end
        if Meta.isexpr(arg, :curly) && first(arg.args) == :Ptr
            if String(last(arg.args)) ∈ keys(typedef_map)
                arg_reps[i] = Expr(:curly, :Ref, Symbol(typedef_map[String(last(arg.args))]))
            else
            arg_reps[i] = Expr(:curly, :Ref, last(arg.args))
            end
        end
    end

    arg_count = 0
    arg_names = map(args) do x
        n = name_safe(name(x))
        s = !isempty(n) ? n : "arg"*string(arg_count+=1)
        Symbol(s)
    end

    signature = efunsig(Symbol(spelling(cursor)[6:end]), arg_names, arg_reps)
    body = eccall(func_name, Symbol(ctx.libname), ret_type, arg_names, arg_reps)
    push!(ctx.api_buffer, Expr(:function, signature, Expr(:block, body)))

    return ctx
end

function eccall(func_name::Symbol, libname::Symbol, rtype, args, types)
  :(ccall(($(QuoteNode(func_name)), $(QuoteNode(libname))),
            $rtype,
            $(Expr(:tuple, types...)),
            $(args...))
    )
end

function is_ptr_type_expr(@nospecialize t)
    (t === :Cstring || t === :Cwstring) && return true
    isa(t, Expr) || return false
    t = t::Expr
    t.head === :curly && t.args[1] === :Ptr
end

function efunsig(name::Symbol, args::Vector{Symbol}, types)
    x = [is_ptr_type_expr(t) ? a : Expr(:(::), a, t) for (a,t) in zip(args,types)]
    Expr(:call, name, x...)
end

function get_comment(cursor::CLCursor)
    stringptr = clang_Cursor_getRawCommentText(cursor.cursor)
    if stringptr.data == C_NULL
        return nothing
    else
        cstring = clang_getCString(stringptr)
        return unsafe_string(cstring)
    end
end

function sort_cursors(cursors::Vector{CLCursor}) 
    cursor_names = spelling.(cursors)
    cursor_dict = Dict(zip(cursor_names, cursors))
    sort!(unique!(cursor_names))
    sorted_cursors = [cursor_dict[cursor_names[j]] for j in 1:length(cursor_names)]
    return sorted_cursors
end

############################################################
###########################################################

for (i, child) in enumerate(ctx.children)
    # Cursor properties
    child_name = name(child)
    child_kind = kind(child)
    ctx.children_index = i
    # Skip compiler constants/garbage and type aliasing
    startswith(child_name, "_") && continue
    startswith(child_name, "DAQmx_Switch") && continue
    child_name ∈ blacklist && continue
    #(child_kind == CXCursor_TypedefDecl && child_name ∈ keys(typedef_map)) && continue
    child_kind == CXCursor_TypedefDecl && continue
    child_name ∈ name.(constants) && continue
    child_name ∈ name.(attributes) && continue

    # Group macro constants by type (later transformed into Julia enums)
    if child_kind == CXCursor_MacroDefinition
        if startswith(child_name, "DAQmxError") || startswith(child_name, "DAQmxWarning")
            continue
        elseif startswith(child_name, "DAQmx_Val_Switch_Topology_")
            push!(topology, child)
            continue
        elseif startswith(child_name, "DAQmx_Val_")
            if child_name == "DAQmx_Val_WaitInfinitely"
                wrap!(ctx, child)
                continue
            end
            push!(constants, child)
            continue
        elseif startswith(child_name, "DAQmx_")
            push!(attributes, child)
            continue
        else
            push!(remaining, child)
            continue
        end
    end
    if child_kind == CXCursor_FunctionDecl
        wrap_dealias!(ctx, child)
        continue
    else
        #wrap!(ctx, child) # skip struct/enum and handful of type declarations (implement manually)
        push!(remaining, child)
    end
end

sorted_attributes = sort_cursors(attributes)
sorted_constants = sort_cursors(constants)


############################################################
###########################################################

