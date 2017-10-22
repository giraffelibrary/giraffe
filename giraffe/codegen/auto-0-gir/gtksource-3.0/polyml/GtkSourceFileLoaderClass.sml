structure GtkSourceFileLoaderClass :>
  GTK_SOURCE_FILE_LOADER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_loader = unit
    type 'a class = 'a file_loader class
  end
