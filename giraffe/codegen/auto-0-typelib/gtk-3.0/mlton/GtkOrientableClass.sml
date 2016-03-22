structure GtkOrientableClass :>
  GTK_ORIENTABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a orientable = unit
    type 'a class = 'a orientable class
  end
