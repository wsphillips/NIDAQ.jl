

expr = Expr(:macrocall, Symbol("@enum"), nothing, Expr(:curly, :TestType, Int64), :begin)
push!(expr.args, :quote)
push!(expr.args, #= none:2 =#)
push!(expr.args, :(a = 456))

str = "@enum TestType{Int64} begin
    a = 123
    b = 456
    c = 999
end"

test = Meta.parse(str)

@cenum blah begin
    aboo = 123
    bbar = 456
    cBAZZ = 234
end

function foo2(test::Integer)
    println(test)
end

foo(aboo)
