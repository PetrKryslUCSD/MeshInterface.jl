module MeshInterface

"""
    NoSuchTrait

Type corresponding to "no such trait" in dispatch.  
"""
struct NoSuchTrait end

"""
    FESetTrait

Trait of finite element sets.  
"""
abstract type FESetTrait end
fesettrait(a) = NoSuchTrait()

"""
    FEMeshTrait

Trait of finite element meshes.  
"""
abstract type FEMeshTrait end
femeshtrait(a) = NoSuchTrait()

"""
    numberofsets(x::T) where T

Number of finite element sets in the mesh.  
"""
numberofsets(x::T) where T = _numberofsets(femeshtrait(T), x)
_numberofsets(::NoSuchTrait, x) = 0

"""
    numberofelements(x::T) where T

Number of elements in a finite element set.  
"""
numberofelements(x::T) where T = _numberofelements(fesettrait(T), x)
_numberofelements(::NoSuchTrait, x) = 0

"""
    numberofnodesperelement(x::T) where T

Number of nodes per element.  
"""
numberofnodesperelement(x::T) where T = _numberofnodesperelement(fesettrait(T), x)
_numberofnodesperelement(::NoSuchTrait, x) = 0

"""
    getconn!(c::C, fes::T, i) where {C, T}

Retrieve connectivity of the `i`th element in the set.  
"""
getconn!(c::C, fes::T, i) where {C, T} = _getconn!(fesettrait(T), c::C, fes::T, i)
_getconn!(::NoSuchTrait, c::C, fes::T, i) where {C, T} = c




end # module
