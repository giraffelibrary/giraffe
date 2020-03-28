structure Utf8CArrayNType =
  CPointerCArrayNType(
    structure CElemType = Utf8.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CArrayN = CArrayN(Utf8CArrayNType)
