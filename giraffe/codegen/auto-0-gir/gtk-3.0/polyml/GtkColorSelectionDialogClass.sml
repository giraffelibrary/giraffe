structure GtkColorSelectionDialogClass :>
  GTK_COLOR_SELECTION_DIALOG_CLASS
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a dialog_class = 'a GtkDialogClass.class
    open GtkDialogClass
    type 'a color_selection_dialog = unit
    type 'a class = 'a color_selection_dialog class
  end
