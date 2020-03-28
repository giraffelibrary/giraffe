structure GInt32CArrayNType =
  CValueCArrayNType(
    structure CElemType = GInt32.C.ValueType
    structure ElemSequence = CValueVectorSequence(GInt32.C.ValueType)
  )
structure GInt32CArrayN = CArrayN(GInt32CArrayNType)
