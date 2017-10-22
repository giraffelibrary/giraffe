structure GtkNativeDialogClass :>
  GTK_NATIVE_DIALOG_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a native_dialog = unit
    type 'a class = 'a native_dialog class
  end
