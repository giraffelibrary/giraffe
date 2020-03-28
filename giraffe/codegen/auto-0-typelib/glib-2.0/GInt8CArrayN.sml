structure GInt8CArrayNType =
  CValueCArrayNType(
    structure CElemType = GInt8.C.ValueType
    structure ElemSequence = CValueVectorSequence(GInt8.C.ValueType)
  )
structure GInt8CArrayN = CArrayN(GInt8CArrayNType)
