structure PangoFontFaceClassCArrayNType =
  CPointerCArrayNType(
    structure CElemType = PangoFontFaceClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure PangoFontFaceClassCArrayN = CArrayN(PangoFontFaceClassCArrayNType)
