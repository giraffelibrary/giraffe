signature GIO_NATIVE_VOLUME_MONITOR_CLASS =
  sig
    type 'a native_volume_monitor
    type 'a volume_monitor_class
    include
      CLASS
        where type 'a class = 'a native_volume_monitor volume_monitor_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
