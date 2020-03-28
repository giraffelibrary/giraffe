structure GdkAtomRecordCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GdkAtomRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GdkAtomRecordCArrayN = CArrayN(GdkAtomRecordCArrayNType)
