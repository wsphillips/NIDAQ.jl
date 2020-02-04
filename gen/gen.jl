using Clang, Clang.LibClang
using CEnum

include("clanghelpers.jl")

ctx = DefaultContext()
trans_unit = parse_header("../deps/include/NIDAQmx.h", args=["-fparse-all-comments"],
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
                      ("Task", "Task")
                     ])



blacklist = ["unix","linux", "CVIDECL", "CVITime_DECLARED", "CVICDECL",
             "DAQmxSuccess", "DAQmx_ReadWaitMode",
             "CVIAbsoluteTime_DECLARED", "TRUE", "FALSE", "NULL", "DAQmxFailed",
             "CVICALLBACK"]

neg_constants = ["DAQmx_Val_Cfg_Default", "DAQmx_Val_Default", "DAQmx_Val_Auto"]


###########################################################
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
        #skip struct/enum and handful of type declarations (implement manually)
        push!(remaining, child)
    end
end

subattributes = Dict{String, Vector{CLMacroDefinition}}()
for prefix in values(attribute_map)
    push!(subattributes, prefix => Vector{CLMacroDefinition}())
end

sorted_attributes = sort_cursors(attributes)
sorted_constants = sort_cursors(constants)
redundant = []

for (i, cursor) in enumerate(sorted_attributes)
    cursor_name = name(cursor)
    key = split(cursor_name, "_")[2]
    if key ∈ keys(attribute_map)
        push!(subattributes[attribute_map[key]], sorted_attributes[i])
        push!(redundant, i)
    end
end

deleteat!(sorted_attributes, redundant)

for key in keys(subattributes)
    wrap_macro2enum!(ctx, subattributes[key], key)
end

wrap_macro2enum!(ctx, sorted_attributes, "DAQmxAttribute")
wrap_macro2enum!(ctx, sorted_constants, "DAQmxConstant")

api_file = joinpath(@__DIR__, "libdaqmx_api.jl")
open(api_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, ctx.api_buffer)
end

common_file = joinpath(@__DIR__, "libdaqmx_common.jl")
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end

###########################################################
###########################################################

