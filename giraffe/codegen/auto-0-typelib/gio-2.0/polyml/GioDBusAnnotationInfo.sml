structure GioDBusAnnotationInfo :>
  GIO_D_BUS_ANNOTATION_INFO
    where type t = GioDBusAnnotationInfoRecord.t
    where type d_bus_annotation_info_record_c_array_t = GioDBusAnnotationInfoRecordCArray.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_annotation_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val lookup_ = call (getSymbol "g_dbus_annotation_info_lookup") (GioDBusAnnotationInfoRecordCArray.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GioDBusAnnotationInfoRecord.t
    type d_bus_annotation_info_record_c_array_t = GioDBusAnnotationInfoRecordCArray.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup (annotations, name) = (GioDBusAnnotationInfoRecordCArray.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name)
  end
