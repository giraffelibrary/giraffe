structure GUInt32CArrayNType =
  CValueCArrayNType(
    structure CElemType = GUInt32.C.ValueType
    structure ElemSequence = CValueVectorSequence(GUInt32.C.ValueType)
  )
structure GUInt32CArrayN = CArrayN(GUInt32CArrayNType)
