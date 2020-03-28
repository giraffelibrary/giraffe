structure GUInt32CArrayType =
  CValueCArrayType(
    structure CElemType = GUInt32.C.ValueType
    structure ElemSequence = CValueVectorSequence(GUInt32.C.ValueType)
  )
structure GUInt32CArray = CArray(GUInt32CArrayType)
