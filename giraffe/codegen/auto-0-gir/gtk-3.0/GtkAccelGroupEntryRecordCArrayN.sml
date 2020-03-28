structure GtkAccelGroupEntryRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GtkAccelGroupEntryRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GtkAccelGroupEntryRecord.C.ValueType)
  )
structure GtkAccelGroupEntryRecordCArrayN = CArrayN(GtkAccelGroupEntryRecordCArrayNType)
