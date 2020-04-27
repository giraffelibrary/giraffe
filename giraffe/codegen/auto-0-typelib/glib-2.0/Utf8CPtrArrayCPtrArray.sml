structure Utf8CPtrArrayCPtrArrayType =
  CPointerCArrayType(
    structure CElemType = Utf8CPtrArray.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CPtrArrayCPtrArray = CArray(Utf8CPtrArrayCPtrArrayType)
