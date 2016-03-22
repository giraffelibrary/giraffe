signature GIO_FILE_ICON_CLASS =
  sig
    type 'a file_icon
    include
      CLASS
        where type 'a class = 'a file_icon GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
