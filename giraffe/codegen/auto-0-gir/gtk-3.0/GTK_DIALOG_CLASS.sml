signature GTK_DIALOG_CLASS =
  sig
    type 'a dialog
    type 'a window_class
    include
      CLASS
        where type 'a class = 'a dialog window_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
