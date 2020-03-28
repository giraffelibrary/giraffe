structure PangoScriptCArrayNType =
  CValueCArrayNType(
    structure CElemType = PangoScript.C.ValueType
    structure ElemSequence = CValueVectorSequence(PangoScript.C.ValueType)
  )
structure PangoScriptCArrayN = CArrayN(PangoScriptCArrayNType)
