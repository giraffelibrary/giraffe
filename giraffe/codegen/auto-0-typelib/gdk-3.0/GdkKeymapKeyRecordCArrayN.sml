structure GdkKeymapKeyRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GdkKeymapKeyRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GdkKeymapKeyRecord.C.ValueType)
  )
structure GdkKeymapKeyRecordCArrayN = CArrayN(GdkKeymapKeyRecordCArrayNType)
