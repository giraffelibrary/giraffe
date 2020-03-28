structure GDoubleCArrayNType =
  CValueCArrayNType(
    structure CElemType = GDouble.C.ValueType
    structure ElemSequence = CValueVectorSequence(GDouble.C.ValueType)
  )
structure GDoubleCArrayN = CArrayN(GDoubleCArrayNType)
