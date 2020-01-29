using Clang, Clang.LibClang

ctx = DefaultContext()

trans_unit = parse_header("/usr/include/NIDAQmx.h",
                          flags = CXTranslationUnit_DetailedPreprocessingRecord)

ctx.libname = "libnidaqmx"
push!(ctx.trans_units, trans_unit)
root_cursor = getcursor(trans_unit)
push!(ctx.cursor_stack, root_cursor)
header = spelling(root_cursor)
ctx.children = children(root_cursor)
test = search(root_cursor, x -> kind(x) == CXCursor_TypedefDecl)
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


for (i, child) in enumerate(ctx.children)
    child_name = name(child)
    child_header = filename(child)
    ctx.children_index = i
    child_kind = kind(child)

    # filter cursors
    startswith(child_name, "__") && continue
    child_name == "CVICALLBACK" && continue
    child_kind == CXCursor_TypedefDecl && CXCursor_MacroDefinition
    # skip type aliasing definitions
    child_name ∈ keys(typemapping) && continue

end

api_file = joinpath(@__DIR__, "libnidaq_api.jl")
api_stream = open(api_file, "w")
