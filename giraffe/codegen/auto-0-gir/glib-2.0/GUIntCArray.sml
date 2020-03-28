structure GUIntCArrayType =
  CValueCArrayType(
    structure CElemType = GUInt.C.ValueType
    structure ElemSequence = CValueVectorSequence(GUInt.C.ValueType)
  )
structure GUIntCArray = CArray(GUIntCArrayType)
