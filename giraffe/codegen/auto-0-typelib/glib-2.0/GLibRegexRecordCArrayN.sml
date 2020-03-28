structure GLibRegexRecordCArrayNType =
  CPointerCArrayNType(
    structure CElemType = GLibRegexRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GLibRegexRecordCArrayN = CArrayN(GLibRegexRecordCArrayNType)
