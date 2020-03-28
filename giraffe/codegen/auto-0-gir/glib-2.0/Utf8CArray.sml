structure Utf8CArrayType =
  CPointerCArrayType(
    structure CElemType = Utf8.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CArray = CArray(Utf8CArrayType)
