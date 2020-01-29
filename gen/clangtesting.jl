using Clang, Clang.LibClang
cd("/home/wikphi/")
ctx = DefaultContext()

trans_unit = parse_header("NIDAQmx.h",
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "libnidaqmx"


push!(ctx.trans_units, trans_unit)

root_cursor = getcursor(trans_unit)
push!(ctx.cursor_stack, root_cursor)
header = spelling(root_cursor)
#ctx.children = children(root_cursor)
ctx.children = search(root_cursor, x -> kind(x) == CXCursor_MacroDefinition)

errorstack = Array{CLMacroDefinition,1}()

for (i, child) in enumerate(ctx.children)
    child_name = name(child)
    child_header = filename(child)
    ctx.children_index = i
    child_kind = kind(child)
    if startswith(child_name, "DAQmxError")
        push!(errorstack, child)
    end
    # filter cursors
    #startswith(child_name, "__") && continue
    #child_name == "CVICALLBACK" && continue
    #child_kind == CXCursor_TypedefDecl && CXCursor_MacroDefinition
    # skip type aliasing definitions
    #child_name ∈ keys(typemapping) && continue
end



typemapping = Dict([("int8", "Cchar"),
                    ("uInt8", "Cuchar"),
                    ("int16", "Cshort"),
                    ("uInt16", "Cushort"),
                    ("int32", "Cint"),
                    ("uInt32", "Cuint"),
                    ("float32", "Cfloat"),
                    ("int64", "Clonglong"),
                    ("uInt64", "Culonglong"),
                    ("bool32", "Cuint")
                   ])




function wrap_macrodefs!(ctx::AbstractContext, cursors::Array{CLMacroDefinition,1})
   cursor_names = Vector{String}()
   for cursor in errorstack
       push!(cursor_names, name(cursor)[11:end])
   end
# TODO: keep working through this. May be helpful to look at how macro definitions are processed.
# There's an example in the tests for CLang.jl as well...

   enum_sym = symbol_safe(cursor_name)
   enum_type = INT_CONVERSION[clang2julia(cursor)]
   name2value = Tuple{Symbol,Int}[]
   # extract values and names
   for item_cursor in children(cursor)
       item_name = spelling(item_cursor)
       item_sym = symbol_safe(item_name)
       push!(name2value, (item_sym, value(item_cursor)))
   end

   if enum_type == UInt32
       expr = Expr(:macrocall, Symbol("@cenum"), nothing, enum_sym)
   else
       expr = Expr(:macrocall, Symbol("@cenum"), nothing, Expr(:curly, enum_sym, enum_type))
   end

   ctx.common_buffer[enum_sym] = ExprUnit(expr)
   for (name,value) in name2value
       ctx.common_buffer[name] = ctx.common_buffer[enum_sym]  ##???
       push!(expr.args, :($name = $value))
   end

   return ctx
end


api_file = joinpath(@__DIR__, "libnidaq_api.jl")
api_stream = open(api_file, "w")
