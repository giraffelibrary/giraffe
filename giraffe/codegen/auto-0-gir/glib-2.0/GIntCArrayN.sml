structure GIntCArrayNType =
  CValueCArrayNType(
    structure CElemType = GInt.C.ValueType
    structure ElemSequence = CValueVectorSequence(GInt.C.ValueType)
  )
structure GIntCArrayN = CArrayN(GIntCArrayNType)
