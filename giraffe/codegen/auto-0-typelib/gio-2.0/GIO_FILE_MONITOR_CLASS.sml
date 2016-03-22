signature GIO_FILE_MONITOR_CLASS =
  sig
    type 'a file_monitor
    include
      CLASS
        where type 'a class = 'a file_monitor GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
