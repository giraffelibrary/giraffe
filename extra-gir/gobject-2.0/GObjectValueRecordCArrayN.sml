structure GObjectValueRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GObjectValueRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GObjectValueRecord.C.ValueType)
  )
structure GObjectValueRecordCArrayN = CArrayN(GObjectValueRecordCArrayNType)
