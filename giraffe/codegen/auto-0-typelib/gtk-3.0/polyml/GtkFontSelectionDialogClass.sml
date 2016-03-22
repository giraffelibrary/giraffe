structure GtkFontSelectionDialogClass :>
  GTK_FONT_SELECTION_DIALOG_CLASS
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a dialog_class = 'a GtkDialogClass.class
    open GtkDialogClass
    type 'a font_selection_dialog = unit
    type 'a class = 'a font_selection_dialog class
  end
