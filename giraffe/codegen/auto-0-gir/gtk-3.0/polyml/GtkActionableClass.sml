structure GtkActionableClass :>
  GTK_ACTIONABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a actionable = unit
    type 'a class = 'a actionable class
  end
