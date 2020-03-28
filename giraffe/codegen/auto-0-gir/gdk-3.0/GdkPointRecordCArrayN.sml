structure GdkPointRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GdkPointRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GdkPointRecord.C.ValueType)
  )
structure GdkPointRecordCArrayN = CArrayN(GdkPointRecordCArrayNType)
