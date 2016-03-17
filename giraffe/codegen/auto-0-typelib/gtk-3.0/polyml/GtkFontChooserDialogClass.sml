structure GtkFontChooserDialogClass :>
  GTK_FONT_CHOOSER_DIALOG_CLASS
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a font_chooser_dialog = unit
    type 'a dialog_class = 'a GtkDialogClass.class
    type 'a class = 'a font_chooser_dialog dialog_class
    type t = base class
    fun toBase obj = obj
    val t = GtkDialogClass.t
    val tOpt = GtkDialogClass.tOpt
    structure C = GtkDialogClass.C
  end
