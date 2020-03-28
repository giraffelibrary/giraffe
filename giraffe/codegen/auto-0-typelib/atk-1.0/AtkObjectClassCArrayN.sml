structure AtkObjectClassCArrayNType =
  CPointerCArrayNType(
    structure CElemType = AtkObjectClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure AtkObjectClassCArrayN = CArrayN(AtkObjectClassCArrayNType)
