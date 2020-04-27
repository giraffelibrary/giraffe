structure GLibVariantTypeRecordCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibVariantTypeRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibVariantTypeRecordCPtrArrayN = CArrayN(GLibVariantTypeRecordCPtrArrayNType)
