structure PangoFontFamilyClassCPtrArrayNType =
  CPointerCArrayNType(
    structure CElemType = PangoFontFamilyClass.C.PointerType
    structure Sequence = VectorSequence
  )
structure PangoFontFamilyClassCPtrArrayN = CArrayN(PangoFontFamilyClassCPtrArrayNType)
