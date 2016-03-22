structure GtkSizeGroupClass :>
  GTK_SIZE_GROUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a size_group = unit
    type 'a class = 'a size_group class
  end
