signature GTK_COLOR_SELECTION_DIALOG_CLASS =
  sig
    type 'a color_selection_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a color_selection_dialog dialog_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
