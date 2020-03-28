structure PangoLogAttrRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = PangoLogAttrRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(PangoLogAttrRecord.C.ValueType)
  )
structure PangoLogAttrRecordCArrayN = CArrayN(PangoLogAttrRecordCArrayNType)
