structure AtkStateTypeCArrayNType =
  CValueCArrayNType(
    structure CElemType = AtkStateType.C.ValueType
    structure ElemSequence = CValueVectorSequence(AtkStateType.C.ValueType)
  )
structure AtkStateTypeCArrayN = CArrayN(AtkStateTypeCArrayNType)
