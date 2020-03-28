structure GUInt8CArrayType =
  CValueCArrayType(
    structure CElemType = GUInt8.C.ValueType
    structure ElemSequence = MonoVectorSequence(Word8Vector)
  )
structure GUInt8CArray = CArray(GUInt8CArrayType)
