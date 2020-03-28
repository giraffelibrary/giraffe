structure GIntCArrayType =
  CValueCArrayType(
    structure CElemType = GInt.C.ValueType
    structure ElemSequence = CValueVectorSequence(GInt.C.ValueType)
  )
structure GIntCArray = CArray(GIntCArrayType)
