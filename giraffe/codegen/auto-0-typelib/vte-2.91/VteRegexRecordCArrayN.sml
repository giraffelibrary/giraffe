structure VteRegexRecordCArrayNType =
  CPointerCArrayNType(
    structure CElemType = VteRegexRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure VteRegexRecordCArrayN = CArrayN(VteRegexRecordCArrayNType)
