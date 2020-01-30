using Clang, Clang.LibClang
cd("/home/wikphi@ad.cmm.se/")
ctx = DefaultContext()

trans_unit = parse_header("NIDAQmx.h",
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "libnidaqmx"
push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
push!(ctx.cursor_stack, root_cursor)
header = spelling(root_cursor)
ctx.children = children(root_cursor)

errors = Vector{CLMacroDefinition}()
warnings = Vector{CLMacroDefinition}()
constants = Vector{CLMacroDefinition}()

# Type aliasing map used by NIDAQmx.h
typedef_map = Dict([("int8", Cchar),
                    ("uInt8", Cuchar),
                    ("int16", Cshort),
                    ("uInt16", Cushort),
                    ("int32", Cint),
                    ("uInt32", Cuint),
                    ("float32", Cfloat),
                    ("int64", Clonglong),
                    ("uInt64", Culonglong),
                    ("bool32", Cuint)
                   ])

# Error codes are Cint, all other constants are Cushort
constant_types = Dict([("DAQmxError", Cint),
                       ("DAQmxWarning", Cint),
                       ("DAQmxConstant", Cushort)])

for child in ctx.children
    # Cursor properties
    child_name = name(child)
    child_kind = kind(child)

    # Skip compiler constants and type aliasing
    startswith(child_name, "__") && continue
    child_name == "CVICALLBACK" && continue
    (child_kind == CXCursor_TypedefDecl && child_name ∈ keys(typedef_map)) && continue

    # Group macro constants by type (later transformed into Julia enums)
    if child_kind == CXCursor_MacroDefinition
        if startswith(child_name, "DAQmxError")
            push!(errors, child)
            continue
        elseif startswith(child_name, "DAQmxWarning")
            push!(warnings, child)
            continue
        elseif startswith(child_name, "DAQmx")
            push!(constants, child)
            continue
        end
    end
#=
    if child_kind == CXCursor_FunctionDecl
        # TODO: modify args and return type to non-aliased then wrap
        wrap!(ctx, child)
    elseif child_kind == CXCursor_TypedefDecl
        # TODO: maybe need a helper for the CVI struct + enum
        wrap!(ctx, child)
    else # catch everything else in ctx.common_buffer
        wrap!(ctx, child)
    end
=#
end

wrap_macro2enum!(ctx, warnings, "DAQmxWarning")


function wrap_macro2enum!(ctx::AbstractContext,
                         cursors::Vector{CLMacroDefinition},
                         constant_type::String)

     enum_sym = symbol_safe(constant_type)
     enum_type = constant_types[constant_type]

     name2value = Tuple{Symbol,enum_type}[]
     # extract values and names
     for cursor in cursors

         if constant_type == "DAQmxConstant"
             item_name = spelling(cursor)[6:end]
         else
             item_name = spelling(cursor)[(length(constant_type)+1):end]
         end

         item_sym = symbol_safe(item_name)
         tokens = tokenize(cursor)

         for i in 1:length(tokens)
             if typeof(tokens[i]) == Literal && constant_type == "DAQmxError"
                 push!(name2value, (item_sym, -parse(enum_type, tokens[i].text)))
             elseif typeof(tokens[i]) == Literal
                 push!(name2value, (item_sym, parse(enum_type, tokens[i].text)))
             end
         end

     end

   expr = Expr(:macrocall, Symbol("@enum"), nothing, Expr(:curly, enum_sym, enum_type))

   ctx.common_buffer[enum_sym] = ExprUnit(expr)

   for (name,value) in name2value
       ctx.common_buffer[name] = ctx.common_buffer[enum_sym]  ##???
       push!(expr.args, :($name = $value))
   end
   return ctx
end

common_file = joinpath(@__DIR__, "test_common.jl")
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end
api_file = joinpath(@__DIR__, "libnidaq_api.jl")
api_stream = open(api_file, "w")


#ctx.children = search(root_cursor, x -> kind(x) == CXCursor_MacroDefinition)
