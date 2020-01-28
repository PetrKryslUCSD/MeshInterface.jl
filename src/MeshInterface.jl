module MeshInterface

struct NoSuchTrait end

abstract type FESetTrait end
fesettrait(a) = NoSuchTrait()
abstract type FEMeshTrait end
femeshtrait(a) = NoSuchTrait()

numberofsets(x::T) where T = _numberofsets(femeshtrait(T), x)
_numberofsets(::NoSuchTrait, x) = 0
numberofelements(x::T) where T = _numberofelements(fesettrait(T), x)
_numberofelements(::NoSuchTrait, x) = 0
numberofnodesperelement(x::T) where T = _numberofnodesperelement(fesettrait(T), x)
_numberofnodesperelement(::NoSuchTrait, x) = 0
getconn!(c::C, fes::T, i) where {C, T} = _getconn!(fesettrait(T), c::C, fes::T, i)
_getconn!(::NoSuchTrait, c::C, fes::T, i) where {C, T} = c




end # module
