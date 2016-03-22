structure GtkDialogClass :>
  GTK_DIALOG_CLASS
    where type 'a window_class = 'a GtkWindowClass.class
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a window_class = 'a GtkWindowClass.class
    open GtkWindowClass
    type 'a dialog = unit
    type 'a class = 'a dialog class
  end
