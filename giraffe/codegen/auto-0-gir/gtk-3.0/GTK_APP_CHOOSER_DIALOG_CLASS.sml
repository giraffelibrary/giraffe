signature GTK_APP_CHOOSER_DIALOG_CLASS =
  sig
    type 'a app_chooser_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a app_chooser_dialog dialog_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
