structure GObjectObjectClassCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GObjectObjectClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure GObjectObjectClassCArrayN = CArrayN(GObjectObjectClassCArrayNType)
