signature GIO_VOLUME_MONITOR_CLASS =
  sig
    type 'a volume_monitor
    include
      CLASS
        where type 'a class = 'a volume_monitor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
