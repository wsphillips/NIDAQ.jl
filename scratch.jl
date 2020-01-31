

expr = Expr(:macrocall, Symbol("@enum"), nothing, Expr(:curly, :TestType, Int64), :begin)
push!(expr.args, :quote)
push!(expr.args, #= none:2 =#)
push!(expr.args, :(a = 456))
push!(expr.args, :end)
str = "@enum TestType{Int64} begin
    a = 123
    b = 456
    c = 999
end"

test = Meta.parse(str)

@enum blah begin
    a = 123
    b = 456
    c = 234
end
