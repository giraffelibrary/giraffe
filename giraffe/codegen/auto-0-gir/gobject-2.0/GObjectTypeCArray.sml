structure GObjectTypeCArrayType =
  CValueCArrayType(
    structure CElemType = GObjectType.C.ValueType
    structure ElemSequence = CValueVectorSequence(GObjectType.C.ValueType)
  )
structure GObjectTypeCArray = CArray(GObjectTypeCArrayType)
