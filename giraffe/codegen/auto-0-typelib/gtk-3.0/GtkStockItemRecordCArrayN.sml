structure GtkStockItemRecordCArrayNType =
  CValueCArrayNType(
    structure CElemType = GtkStockItemRecord.C.ValueType
    structure ElemSequence = CValueVectorSequence(GtkStockItemRecord.C.ValueType)
  )
structure GtkStockItemRecordCArrayN = CArrayN(GtkStockItemRecordCArrayNType)
