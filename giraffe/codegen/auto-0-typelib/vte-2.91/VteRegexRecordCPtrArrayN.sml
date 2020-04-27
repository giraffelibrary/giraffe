structure VteRegexRecordCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = VteRegexRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure VteRegexRecordCPtrArrayN = CArrayN(VteRegexRecordCPtrArrayNType)
