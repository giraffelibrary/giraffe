structure PangoFontFaceClassCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = PangoFontFaceClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure PangoFontFaceClassCPtrArrayN = CArrayN(PangoFontFaceClassCPtrArrayNType)
