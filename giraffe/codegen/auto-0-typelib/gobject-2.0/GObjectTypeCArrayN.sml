structure GObjectTypeCArrayNType =
  CValueCArrayNType(
    structure CElemType = GObjectType.C.ValueType
    structure ElemSequence = CValueVectorSequence(GObjectType.C.ValueType)
  )
structure GObjectTypeCArrayN = CArrayN(GObjectTypeCArrayNType)
