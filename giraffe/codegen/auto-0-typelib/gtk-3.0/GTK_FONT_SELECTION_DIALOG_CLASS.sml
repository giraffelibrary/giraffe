signature GTK_FONT_SELECTION_DIALOG_CLASS =
  sig
    type 'a font_selection_dialog
    type 'a dialog_class
    include
      CLASS
        where type 'a class = 'a font_selection_dialog dialog_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
