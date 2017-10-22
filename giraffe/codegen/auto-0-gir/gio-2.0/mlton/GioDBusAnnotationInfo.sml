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
    val getType_ = _import "g_dbus_annotation_info_get_type" : unit -> GObjectType.FFI.val_;
    val lookup_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_dbus_annotation_info_lookup" :
              GioDBusAnnotationInfoRecordCVector.MLton.p1
               * unit GioDBusAnnotationInfoRecordCVector.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = GioDBusAnnotationInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup (annotations, name) = (GioDBusAnnotationInfoRecordCVector.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name)
  end
