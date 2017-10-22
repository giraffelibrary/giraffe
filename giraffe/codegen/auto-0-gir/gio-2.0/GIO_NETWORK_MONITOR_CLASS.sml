signature GIO_NETWORK_MONITOR_CLASS =
  sig
    type 'a network_monitor
    include
      CLASS
        where type 'a class = 'a network_monitor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
