structure GBoolCArrayNType =
  CValueCArrayNType(
    structure CElemType = GBool.C.ValueType
    structure ElemSequence = CValueVectorSequence(GBool.C.ValueType)
  )
structure GBoolCArrayN = CArrayN(GBoolCArrayNType)
