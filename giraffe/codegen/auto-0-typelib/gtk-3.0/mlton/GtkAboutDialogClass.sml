structure GtkAboutDialogClass :>
  GTK_ABOUT_DIALOG_CLASS
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a about_dialog = unit
    type 'a dialog_class = 'a GtkDialogClass.class
    type 'a class = 'a about_dialog dialog_class
    type t = base class
    fun toBase obj = obj
    val t = GtkDialogClass.t
    val tOpt = GtkDialogClass.tOpt
    structure C = GtkDialogClass.C
  end
