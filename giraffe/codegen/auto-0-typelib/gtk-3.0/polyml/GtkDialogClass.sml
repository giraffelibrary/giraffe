structure GtkDialogClass :>
  GTK_DIALOG_CLASS
    where type 'a window_class = 'a GtkWindowClass.class
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a dialog = unit
    type 'a window_class = 'a GtkWindowClass.class
    type 'a class = 'a dialog window_class
    type t = base class
    fun toBase obj = obj
    val t = GtkWindowClass.t
    val tOpt = GtkWindowClass.tOpt
    structure C = GtkWindowClass.C
  end
