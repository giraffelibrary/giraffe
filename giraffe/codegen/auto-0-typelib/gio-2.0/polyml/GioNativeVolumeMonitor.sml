structure GioNativeVolumeMonitor :>
  GIO_NATIVE_VOLUME_MONITOR
    where type 'a class_t = 'a GioNativeVolumeMonitorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_native_volume_monitor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GioNativeVolumeMonitorClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
