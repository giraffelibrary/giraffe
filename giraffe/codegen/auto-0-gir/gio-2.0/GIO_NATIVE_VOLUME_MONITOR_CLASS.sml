signature GIO_NATIVE_VOLUME_MONITOR_CLASS =
  sig
    type 'a native_volume_monitor
    type 'a volume_monitor_class
    type 'a class = 'a native_volume_monitor volume_monitor_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
