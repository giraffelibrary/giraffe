structure GLibVariantTypeRecordCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibVariantTypeRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibVariantTypeRecordCArrayN = CArrayN(GLibVariantTypeRecordCArrayNType)
