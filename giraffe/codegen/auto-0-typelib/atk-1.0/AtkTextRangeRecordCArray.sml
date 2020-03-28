structure AtkTextRangeRecordCArrayType =
  CPointerCArrayType(
    structure CElemType = AtkTextRangeRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure AtkTextRangeRecordCArray = CArray(AtkTextRangeRecordCArrayType)
