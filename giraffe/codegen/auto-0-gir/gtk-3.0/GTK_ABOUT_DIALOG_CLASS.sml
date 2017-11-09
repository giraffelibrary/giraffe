signature GTK_ABOUT_DIALOG_CLASS =
  sig
    type 'a about_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a about_dialog dialog_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
