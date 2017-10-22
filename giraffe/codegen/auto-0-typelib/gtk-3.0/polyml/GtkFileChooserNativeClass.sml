structure GtkFileChooserNativeClass :>
  GTK_FILE_CHOOSER_NATIVE_CLASS
    where type 'a native_dialog_class = 'a GtkNativeDialogClass.class
    where type C.notnull = GtkNativeDialogClass.C.notnull
    where type 'a C.p = 'a GtkNativeDialogClass.C.p =
  struct
    type 'a native_dialog_class = 'a GtkNativeDialogClass.class
    open GtkNativeDialogClass
    type 'a file_chooser_native = unit
    type 'a class = 'a file_chooser_native class
  end
