structure GtkFileFilterClass :>
  GTK_FILE_FILTER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a file_filter = unit
    type 'a class = 'a file_filter class
  end
