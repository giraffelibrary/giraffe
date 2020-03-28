structure GtkTargetEntryRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GtkTargetEntryRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GtkTargetEntryRecord.C.ValueType)
  )
structure GtkTargetEntryRecordCArrayN = CArrayN(GtkTargetEntryRecordCArrayNType)
