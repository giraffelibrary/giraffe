structure GioNativeVolumeMonitor :>
  GIO_NATIVE_VOLUME_MONITOR
    where type 'a class = 'a GioNativeVolumeMonitorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_native_volume_monitor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GioNativeVolumeMonitorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
