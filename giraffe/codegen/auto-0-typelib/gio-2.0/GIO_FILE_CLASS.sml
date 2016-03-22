signature GIO_FILE_CLASS =
  sig
    type 'a file
    include
      CLASS
        where type 'a class = 'a file GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
