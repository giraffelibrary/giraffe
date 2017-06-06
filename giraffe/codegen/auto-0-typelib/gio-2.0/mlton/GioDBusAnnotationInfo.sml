structure GioDBusAnnotationInfo :>
  GIO_D_BUS_ANNOTATION_INFO
    where type t = GioDBusAnnotationInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_annotation_info_get_type" : unit -> GObjectType.FFI.val_;
    val lookup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_annotation_info_lookup" :
              GioDBusAnnotationInfoRecord.FFI.notnull GioDBusAnnotationInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioDBusAnnotationInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup annotations name = (GioDBusAnnotationInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name)
  end
