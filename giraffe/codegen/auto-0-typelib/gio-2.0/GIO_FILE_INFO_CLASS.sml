signature GIO_FILE_INFO_CLASS =
  sig
    type 'a file_info
    include
      CLASS
        where type 'a class = 'a file_info GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
