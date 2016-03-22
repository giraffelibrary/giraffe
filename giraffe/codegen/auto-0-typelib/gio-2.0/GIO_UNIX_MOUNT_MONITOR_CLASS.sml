signature GIO_UNIX_MOUNT_MONITOR_CLASS =
  sig
    type 'a unix_mount_monitor
    include
      CLASS
        where type 'a class = 'a unix_mount_monitor GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
