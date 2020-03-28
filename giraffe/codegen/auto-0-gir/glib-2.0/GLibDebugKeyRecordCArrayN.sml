structure GLibDebugKeyRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GLibDebugKeyRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GLibDebugKeyRecord.C.ValueType)
  )
structure GLibDebugKeyRecordCArrayN = CArrayN(GLibDebugKeyRecordCArrayNType)
