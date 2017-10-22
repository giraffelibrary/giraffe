structure GioDBusAnnotationInfo :>
  GIO_D_BUS_ANNOTATION_INFO
    where type t = GioDBusAnnotationInfoRecord.t =
  struct
    structure GioDBusAnnotationInfoRecordCVectorType =
      CPointerCVectorType(
        structure CElemType = GioDBusAnnotationInfoRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GioDBusAnnotationInfoRecordCVector = CVector(GioDBusAnnotationInfoRecordCVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_annotation_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val lookup_ = call (getSymbol "g_dbus_annotation_info_lookup") (GioDBusAnnotationInfoRecordCVector.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GioDBusAnnotationInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup (annotations, name) = (GioDBusAnnotationInfoRecordCVector.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name)
  end
