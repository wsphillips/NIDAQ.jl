using Clang, Clang.LibClang
using CEnum
cd("/home/wikphi/")
ctx = DefaultContext()

trans_unit = parse_header("NIDAQmx.h", args=["-fparse-all-comments"],
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "libnidaqmx"

push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
header = spelling(root_cursor)
ctx.children = children(root_cursor)

errors = Vector{CLMacroDefinition}()

constants = Vector{CLMacroDefinition}()
attributes = Vector{CLMacroDefinition}()
topology = Vector{CLMacroDefinition}()

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

attribute_map = Dict([("_Buf_", "Buffer"),
                    ("_AI_", "AIChannel"),
                    ("_AO_", "AOChannel"),
                    ("_DI_", "DIChannel"),
                    ("_DO_", "DOChannel"),
                    ("_CI_", "CIChannel"),
                    ("_CO_", "COChannel"),
                    ("_Dev_", "Device"),
                    ("_Exported_", "ExportedSignal"),
                    ("_PersistedChan_", "PersistedChannel"),
                    ("_PersistedScale_", "PersistedScale"),
                    ("_PersistedTask_", "PersistedTask"),
                    ("_PhysicalChan_", "PhysicalChannel"),
                    ("_Read_", "Read"),
                    ("_Write_", "Write"),
                    ("_RealTime_", "RealTime"),
                    ("_Scale_", "Scale"),
                    ("_Task_", "Task"),
                   ])

blacklist = ["unix","linux", "CVIDECL", "CVITime_DECLARED",
             "CVIAbsoluteTime_DECLARED", "TRUE", "FALSE", "NULL", "DAQmxFailed",
             "CVICALLBACK"]

# Error codes are Cint, all other constants are as indicated
constant_types = Dict([("Attributes", Cint),

# TODO: need separate non enum constants for DAQmx_Val's that are float32
function wrap_macro2enum!(ctx::AbstractContext,
                          cursors::Vector{CLMacroDefinition}, constant_type::String)

    enum_sym = symbol_safe(constant_type)
    enum_type = Cint
    name2value = Tuple{Symbol,enum_type}[]
    # FIXME: extract values and names
    for cursor in cursors
        if constant_type == "DAQmxConstant"
            item_name = spelling(cursor)[6:end]
        else
            item_name = spelling(cursor)[length(constant_type)+1:end]
        end

        item_sym = symbol_safe(item_name)
        tokens = tokenize(cursor)

        # Macros include bitshift operators, which we have to check for...
        for i in 1:length(tokens)
            if typeof(tokens[i]) == Literal && (i == length(tokens) || tokens[i+1].text ∉ ["<",">"])
                push!(name2value, (item_sym, parse(enum_type, tokens[i].text)))
                break
            elseif typeof(tokens[i]) == Literal && i < length(tokens) && tokens[i+1].text ∈ ["<",">"]
                bitshift = prod(tokens[i:i+3]) # consolidate tokens to a single string
                push!(name2value, (item_sym, eval(Meta.parse(bitshift)))) # Julia understands bit-shift notation
                break
            end
        end
    end

    expr = Expr(:macrocall, Symbol("@enum"), nothing, Expr(:(::), enum_sym, enum_type))
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
    ret_type = :Cint # all NIDAQmx functions return int32 == Cint
    args = function_args(cursor)
    arg_types = [argtype(func_type, i) for i in 0:length(args)-1]
    # TODO: check arg types for aliases and revise to actual C types
    arg_reps = clang2julia.(arg_types)

    for (i, arg) in enumerate(arg_reps)
        # constant array argument should be converted to Ptr
        # e.g. double f[3] => Ptr{Cdouble} instead of NTuple{3, Cdouble}
        if isa(arg, Symbol)
            if String(arg) ∈ keys(typedef_map)
                arg_reps[i] = Symbol(typedef_map[String(arg)])
            end
        end
        if Meta.isexpr(arg, :curly) && first(arg.args) == :NTuple
            if String(last(arg.args)) ∈ keys(typedef_map)
                arg_reps[i] = Expr(:curly, :Ptr, Symbol(typedef_map[String(last(arg.args))]))
            else
            arg_reps[i] = Expr(:curly, :Ptr, last(arg.args))
            end
        end
        if Meta.isexpr(arg, :curly) && first(arg.args) == :Ptr
            if String(last(arg.args)) ∈ keys(typedef_map)
                arg_reps[i] = Expr(:curly, :Ptr, Symbol(typedef_map[String(last(arg.args))]))
            else
            arg_reps[i] = Expr(:curly, :Ptr, last(arg.args))
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

for (i, child) in enumerate(ctx.children)
    # Cursor properties
    child_name = name(child)
    child_kind = kind(child)
    ctx.children_index = i
    # Skip compiler constants/garbage and type aliasing
    startswith(child_name, "_") && continue
    startswith(child_name, "DAQmx_Switch") && continue
    child_name ∈ blacklist && continue
    (child_kind == CXCursor_TypedefDecl && child_name ∈ keys(typedef_map)) && continue

    # Group macro constants by type (later transformed into Julia enums)
    if child_kind == CXCursor_MacroDefinition
        if startswith(child_name, "DAQmxError") || startswith(child_name, "DAQmxWarning")
            push!(errors, child)
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
            wrap!(ctx,child)
            continue
        end
    end
    if child_kind == CXCursor_FunctionDecl
        wrap_dealias!(ctx, child)
    else
        wrap!(ctx, child)
    end
end
