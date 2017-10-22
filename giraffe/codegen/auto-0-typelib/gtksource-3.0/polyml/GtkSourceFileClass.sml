structure GtkSourceFileClass :>
  GTK_SOURCE_FILE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file = unit
    type 'a class = 'a file class
  end
