structure GObjectObjectClassCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GObjectObjectClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure GObjectObjectClassCPtrArrayN = CArrayN(GObjectObjectClassCPtrArrayNType)
