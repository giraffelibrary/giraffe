structure GUInt8CArrayNType =
  CValueCArrayNType(
    structure CElemType = GUInt8.C.ValueType
    structure ElemSequence = MonoVectorSequence(Word8Vector)
  )
structure GUInt8CArrayN = CArrayN(GUInt8CArrayNType)
