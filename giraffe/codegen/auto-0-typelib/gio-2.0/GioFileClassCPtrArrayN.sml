structure GioFileClassCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GioFileClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure GioFileClassCPtrArrayN = CArrayN(GioFileClassCPtrArrayNType)
