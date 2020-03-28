structure GioFileClassCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GioFileClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure GioFileClassCArrayN = CArrayN(GioFileClassCArrayNType)
