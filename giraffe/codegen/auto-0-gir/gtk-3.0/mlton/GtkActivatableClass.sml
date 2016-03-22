structure GtkActivatableClass :>
  GTK_ACTIVATABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a activatable = unit
    type 'a class = 'a activatable class
  end
