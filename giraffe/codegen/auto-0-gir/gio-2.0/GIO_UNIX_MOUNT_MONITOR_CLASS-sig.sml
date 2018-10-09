signature GIO_UNIX_MOUNT_MONITOR_CLASS =
  sig
    type 'a unix_mount_monitor
    include
      CLASS
        where type 'a class = 'a unix_mount_monitor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
