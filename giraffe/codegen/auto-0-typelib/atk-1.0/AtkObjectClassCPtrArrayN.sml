structure AtkObjectClassCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = AtkObjectClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure AtkObjectClassCPtrArrayN = CArrayN(AtkObjectClassCPtrArrayNType)
