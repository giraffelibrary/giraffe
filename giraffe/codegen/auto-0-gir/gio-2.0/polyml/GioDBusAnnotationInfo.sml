structure GioDBusAnnotationInfo :>
  GIO_D_BUS_ANNOTATION_INFO
    where type t = GioDBusAnnotationInfoRecord.t
    where type d_bus_annotation_info_record_c_ptr_array_t = GioDBusAnnotationInfoRecordCPtrArray.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_annotation_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val lookup_ = call (getSymbol "g_dbus_annotation_info_lookup") (GioDBusAnnotationInfoRecordCPtrArray.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GioDBusAnnotationInfoRecord.t
    type d_bus_annotation_info_record_c_ptr_array_t = GioDBusAnnotationInfoRecordCPtrArray.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun lookup (annotations, name) = (GioDBusAnnotationInfoRecordCPtrArray.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) lookup_ (annotations & name) before GioDBusAnnotationInfoRecordCPtrArray.FFI.touchOptPtr annotations before Utf8.FFI.touchPtr name
  end
