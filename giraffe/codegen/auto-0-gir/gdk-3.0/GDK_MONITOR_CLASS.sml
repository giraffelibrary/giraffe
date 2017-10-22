signature GDK_MONITOR_CLASS =
  sig
    type 'a monitor
    include
      CLASS
        where type 'a class = 'a monitor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
