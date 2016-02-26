structure GioNativeVolumeMonitor :>
  GIO_NATIVE_VOLUME_MONITOR
    where type 'a class_t = 'a GioNativeVolumeMonitorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_native_volume_monitor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GioNativeVolumeMonitorClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
