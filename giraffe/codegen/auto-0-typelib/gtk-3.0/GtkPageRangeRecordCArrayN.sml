structure GtkPageRangeRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GtkPageRangeRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GtkPageRangeRecord.C.ValueType)
  )
structure GtkPageRangeRecordCArrayN = CArrayN(GtkPageRangeRecordCArrayNType)
