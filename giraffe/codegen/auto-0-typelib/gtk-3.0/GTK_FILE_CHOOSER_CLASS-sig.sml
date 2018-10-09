signature GTK_FILE_CHOOSER_CLASS =
  sig
    type 'a file_chooser
    include
      CLASS
        where type 'a class = 'a file_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
