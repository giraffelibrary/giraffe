structure Utf8CArrayCArrayType =
  CPointerCArrayType(
    structure CElemType = Utf8CArray.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CArrayCArray = CArray(Utf8CArrayCArrayType)
