structure GtkBuilderClass :>
  GTK_BUILDER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a builder = unit
    type 'a class = 'a builder class
  end
