structure GLibVariantRecordCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibVariantRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibVariantRecordCPtrArrayN = CArrayN(GLibVariantRecordCPtrArrayNType)
