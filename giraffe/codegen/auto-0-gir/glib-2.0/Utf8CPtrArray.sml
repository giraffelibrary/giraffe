structure Utf8CPtrArrayType =
  CPointerCArrayType(
    structure CElemType = Utf8.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CPtrArray = CArray(Utf8CPtrArrayType)
