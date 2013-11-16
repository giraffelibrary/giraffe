structure GtkDialogClass :>
  GTK_DIALOG_CLASS
    where type 'a windowclass_t = 'a GtkWindowClass.t
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a dialog = unit
    type 'a windowclass_t = 'a GtkWindowClass.t
    type 'a t = 'a dialog windowclass_t
    fun toBase obj = obj
    val t = GtkWindowClass.t
    val tOpt = GtkWindowClass.tOpt
    structure C = GtkWindowClass.C
  end
