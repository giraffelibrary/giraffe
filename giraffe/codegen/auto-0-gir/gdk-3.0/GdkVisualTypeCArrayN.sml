structure GdkVisualTypeCArrayNType =
  CValueCArrayNType(
    structure CElemType = GdkVisualType.C.ValueType
    structure ElemSequence = CValueVectorSequence(GdkVisualType.C.ValueType)
  )
structure GdkVisualTypeCArrayN = CArrayN(GdkVisualTypeCArrayNType)
