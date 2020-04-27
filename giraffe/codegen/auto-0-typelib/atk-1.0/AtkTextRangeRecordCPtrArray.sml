structure AtkTextRangeRecordCPtrArrayType =
  CPointerCArrayType(
    structure CElemType = AtkTextRangeRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure AtkTextRangeRecordCPtrArray = CArray(AtkTextRangeRecordCPtrArrayType)
