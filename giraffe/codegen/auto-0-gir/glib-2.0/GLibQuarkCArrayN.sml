structure GLibQuarkCArrayNType =
  CValueCArrayNType(
    structure CElemType = GLibQuark.C.ValueType
    structure ElemSequence = CValueVectorSequence(GLibQuark.C.ValueType)
  )
structure GLibQuarkCArrayN = CArrayN(GLibQuarkCArrayNType)
