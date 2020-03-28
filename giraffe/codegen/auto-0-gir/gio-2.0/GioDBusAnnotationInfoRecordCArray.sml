structure GioDBusAnnotationInfoRecordCArrayType =
  CPointerCArrayType(
    structure CElemType = GioDBusAnnotationInfoRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GioDBusAnnotationInfoRecordCArray = CArray(GioDBusAnnotationInfoRecordCArrayType)
