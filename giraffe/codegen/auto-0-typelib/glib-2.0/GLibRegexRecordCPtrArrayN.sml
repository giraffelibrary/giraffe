structure GLibRegexRecordCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibRegexRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibRegexRecordCPtrArrayN = CArrayN(GLibRegexRecordCPtrArrayNType)
