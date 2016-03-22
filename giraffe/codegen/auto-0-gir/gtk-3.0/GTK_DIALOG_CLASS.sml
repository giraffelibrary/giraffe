signature GTK_DIALOG_CLASS =
  sig
    type 'a dialog
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a dialog window_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
