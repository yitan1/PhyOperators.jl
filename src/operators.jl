export op


struct SiteType{T}
end
SiteType(s::AbstractString) = SiteType{Symbol(s)}()

# op -> operator
struct OpLabel{T}
end
OpLabel(s::AbstractString) = OpLabel{Symbol(s)}()

# SI = [1 0 0; 0 1 0; 1 0 0]
# Sx = [0 1.0 0; 1.0 0 1.0; 0 1.0 0]/sqrt(2);
# Sy = [0 -1im 0; 1im 0 -1im; 0 1im 0]/sqrt(2);
# Sz = [1.0 0 0; 0 0 0; 0 0 -1.0];
# Sp = real(Sx + 1im*Sy)
# Sm = real(Sx - 1im*Sy)


op(label::AbstractString , st::AbstractString) = op(OpLabel(label), SiteType(st))

# operators of spinhalf
op(::OpLabel{:SI}, ::SiteType{:Spinhalf}) = [1 0; 0 1]
op(::OpLabel{:Sx}, ::SiteType{:Spinhalf}) = [0 1; 1 0]/2
op(::OpLabel{:Sy}, ::SiteType{:Spinhalf}) = [0.0 -1.0im; 1.0im 0.0]/2
op(::OpLabel{:Sz}, ::SiteType{:Spinhalf}) = [1 0; 0 -1]/2
op(::OpLabel{:Sp}, ::SiteType{:Spinhalf}) = [0 1; 0 0]
op(::OpLabel{:Sm}, ::SiteType{:Spinhalf}) = [0 0; 1 0]

# operators of spinone
op(::OpLabel{:SI}, ::SiteType{:Spinone}) = [1 0 0; 0 1 0; 1 0 0]
op(::OpLabel{:Sx}, ::SiteType{:Spinone}) = [0 1.0 0; 1.0 0 1.0; 0 1.0 0]/sqrt(2)
op(::OpLabel{:Sy}, ::SiteType{:Spinone}) = [0 -1im 0; 1im 0 -1im; 0 1im 0]/sqrt(2)
op(::OpLabel{:Sz}, ::SiteType{:Spinone}) = [1.0 0 0; 0 0 0; 0 0 -1.0]
# op(::OpLabel{:Sp}, ::SiteType{:Spinone}) = [0 1; 0 0]
# op(::OpLabel{:Sm}, ::SiteType{:Spinone}) = [0 0; 1 0]