structure GtkFontChooserDialogClass :>
  GTK_FONT_CHOOSER_DIALOG_CLASS
    where type 'a dialog_class_t = 'a GtkDialogClass.t
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a font_chooser_dialog = unit
    type 'a dialog_class_t = 'a GtkDialogClass.t
    type 'a t = 'a font_chooser_dialog dialog_class_t
    fun toBase obj = obj
    val t = GtkDialogClass.t
    val tOpt = GtkDialogClass.tOpt
    structure C = GtkDialogClass.C
  end
