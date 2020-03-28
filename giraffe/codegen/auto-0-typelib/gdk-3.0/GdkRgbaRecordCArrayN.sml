structure GdkRgbaRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GdkRgbaRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GdkRgbaRecord.C.ValueType)
  )
structure GdkRgbaRecordCArrayN = CArrayN(GdkRgbaRecordCArrayNType)
