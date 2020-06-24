structure GioDBusAnnotationInfo :>
  GIO_D_BUS_ANNOTATION_INFO
    where type t = GioDBusAnnotationInfoRecord.t
    where type d_bus_annotation_info_record_c_ptr_array_t = GioDBusAnnotationInfoRecordCPtrArray.t =
  struct
    val getType_ = _import "g_dbus_annotation_info_get_type" : unit -> GObjectType.FFI.val_;
    val lookup_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_dbus_annotation_info_lookup" :
              GioDBusAnnotationInfoRecordCPtrArray.MLton.p1
               * GioDBusAnnotationInfoRecordCPtrArray.FFI.opt GioDBusAnnotationInfoRecordCPtrArray.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = GioDBusAnnotationInfoRecord.t
    type d_bus_annotation_info_record_c_ptr_array_t = GioDBusAnnotationInfoRecordCPtrArray.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup (annotations, name) = (GioDBusAnnotationInfoRecordCPtrArray.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name)
  end
