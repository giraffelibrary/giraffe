signature GIO_FILE_DESCRIPTOR_BASED_CLASS =
  sig
    type 'a file_descriptor_based
    include
      CLASS
        where type 'a class = 'a file_descriptor_based GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
