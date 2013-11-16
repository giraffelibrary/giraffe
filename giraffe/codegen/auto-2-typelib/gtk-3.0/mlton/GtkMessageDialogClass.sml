structure GtkMessageDialogClass :>
  GTK_MESSAGE_DIALOG_CLASS
    where type 'a dialogclass_t = 'a GtkDialogClass.t
    where type C.notnull = GtkDialogClass.C.notnull
    where type 'a C.p = 'a GtkDialogClass.C.p =
  struct
    type 'a messagedialog = unit
    type 'a dialogclass_t = 'a GtkDialogClass.t
    type 'a t = 'a messagedialog dialogclass_t
    fun toBase obj = obj
    val t = GtkDialogClass.t
    val tOpt = GtkDialogClass.tOpt
    structure C = GtkDialogClass.C
  end
