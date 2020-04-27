structure Utf8CPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = Utf8.C.ArrayType
    structure Sequence = VectorSequence
  )
structure Utf8CPtrArrayN = CArrayN(Utf8CPtrArrayNType)
