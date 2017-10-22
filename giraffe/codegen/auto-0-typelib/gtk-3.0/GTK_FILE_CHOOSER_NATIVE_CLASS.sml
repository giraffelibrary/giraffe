signature GTK_FILE_CHOOSER_NATIVE_CLASS =
  sig
    type 'a file_chooser_native
    type 'a native_dialog_class
    include
      CLASS
        where type 'a class = 'a file_chooser_native native_dialog_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
