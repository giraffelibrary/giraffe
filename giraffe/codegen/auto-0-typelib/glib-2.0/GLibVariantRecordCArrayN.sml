structure GLibVariantRecordCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibVariantRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibVariantRecordCArrayN = CArrayN(GLibVariantRecordCArrayNType)
