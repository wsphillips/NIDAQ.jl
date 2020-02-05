function wrap_macro2enum!(ctx::AbstractContext,
                          cursors::Vector{CLMacroDefinition},
                          constant_type::String)

    enum_sym = symbol_safe(constant_type)
    enum_type = Cint
    name2value = Tuple{Symbol,enum_type}[]
    
    for cursor in cursors
        if constant_type == "DAQmxAttribute"
            item_name = spelling(cursor)[7:end]
        elseif constant_type == "DAQmxConstant"
            item_name = spelling(cursor)[length("DAQmx_Val_")+1:end]
        else
            item_name = prod(split(name(cursor), "_")[3:end])
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
                bitshift = tokens[i].text * tokens[i + 1].text * tokens[i + 2].text 
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

function sort_cursors(cursors::Vector{CLMacroDefinition}) 
    cursor_names = spelling.(cursors)
    cursor_dict = Dict(zip(cursor_names, cursors))
    sort!(unique!(cursor_names))
    sorted_cursors = [cursor_dict[cursor_names[j]] for j in 1:length(cursor_names)]
    return sorted_cursors
end
