structure PangoFontFamilyClassCArrayNType =
  CPointerCArrayNType(
    structure CElemType = PangoFontFamilyClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure PangoFontFamilyClassCArrayN = CArrayN(PangoFontFamilyClassCArrayNType)
