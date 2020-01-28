module MeshInterface

struct NoSuchTrait end

struct FESetTrait end
fesettrait(a) = NoSuchTrait()
struct FEMeshTrait end
femeshtrait(a) = NoSuchTrait()

numberofelements(x::T) where T = _numberofelements(fesettrait(T), x)
_numberofelements(::NoSuchTrait, x) = 0
getconn!(c::C, fes::T, i) where {C, T} = _getconn!(fesettrait(T), c::C, fes::T, i)
_getconn!(::NoSuchTrait, c::C, fes::T, i) where {C, T} = c

end # module
