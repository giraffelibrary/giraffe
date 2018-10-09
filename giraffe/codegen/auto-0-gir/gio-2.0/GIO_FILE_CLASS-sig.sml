signature GIO_FILE_CLASS =
  sig
    type 'a file
    include
      CLASS
        where type 'a class = 'a file GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
