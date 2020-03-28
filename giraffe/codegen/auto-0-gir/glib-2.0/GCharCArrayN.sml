structure GCharCArrayNType =
  CValueCArrayNType(
    structure CElemType = GChar.C.ValueType
    structure ElemSequence = MonoVectorSequence(CharVector)
  )
structure GCharCArrayN = CArrayN(GCharCArrayNType)
