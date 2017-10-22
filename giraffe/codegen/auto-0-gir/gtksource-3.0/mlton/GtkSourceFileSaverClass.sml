structure GtkSourceFileSaverClass :>
  GTK_SOURCE_FILE_SAVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_saver = unit
    type 'a class = 'a file_saver class
  end
