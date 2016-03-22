structure GtkBuildableClass :>
  GTK_BUILDABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a buildable = unit
    type 'a class = 'a buildable class
  end
