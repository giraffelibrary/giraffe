signature GTK_SOURCE_FILE_LOADER_CLASS =
  sig
    type 'a file_loader
    include
      CLASS
        where type 'a class = 'a file_loader GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
