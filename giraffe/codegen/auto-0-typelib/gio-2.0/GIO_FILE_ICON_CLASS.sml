signature GIO_FILE_ICON_CLASS =
  sig
    type 'a file_icon
    include
      CLASS
        where type 'a class = 'a file_icon GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
