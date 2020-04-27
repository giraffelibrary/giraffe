structure GdkAtomRecordCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GdkAtomRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GdkAtomRecordCPtrArrayN = CArrayN(GdkAtomRecordCPtrArrayNType)
