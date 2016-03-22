structure GtkFileChooserClass :>
  GTK_FILE_CHOOSER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_chooser = unit
    type 'a class = 'a file_chooser class
  end
