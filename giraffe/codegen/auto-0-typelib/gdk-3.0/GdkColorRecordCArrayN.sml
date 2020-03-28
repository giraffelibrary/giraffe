structure GdkColorRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GdkColorRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GdkColorRecord.C.ValueType)
  )
structure GdkColorRecordCArrayN = CArrayN(GdkColorRecordCArrayNType)
