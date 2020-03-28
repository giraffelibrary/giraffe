structure GInt32CArrayType =
  CValueCArrayType(
    structure CElemType = GInt32.C.ValueType
    structure ElemSequence = CValueVectorSequence(GInt32.C.ValueType)
  )
structure GInt32CArray = CArray(GInt32CArrayType)
