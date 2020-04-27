structure GioDBusAnnotationInfoRecordCPtrArrayType =
  CPointerCArrayType(
    structure CElemType = GioDBusAnnotationInfoRecord.C.PointerType
    structure Sequence = VectorSequence
  )
structure GioDBusAnnotationInfoRecordCPtrArray = CArray(GioDBusAnnotationInfoRecordCPtrArrayType)
