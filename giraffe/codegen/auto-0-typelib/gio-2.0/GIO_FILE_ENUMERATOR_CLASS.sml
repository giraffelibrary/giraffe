signature GIO_FILE_ENUMERATOR_CLASS =
  sig
    type 'a file_enumerator
    include
      CLASS
        where type 'a class = 'a file_enumerator GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
