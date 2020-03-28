structure GUIntCArrayNType =
  CValueCArrayNType(
    structure CElemType = GUInt.C.ValueType
    structure ElemSequence = CValueVectorSequence(GUInt.C.ValueType)
  )
structure GUIntCArrayN = CArrayN(GUIntCArrayNType)
