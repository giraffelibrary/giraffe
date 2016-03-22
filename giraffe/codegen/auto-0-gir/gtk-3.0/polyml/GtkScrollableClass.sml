structure GtkScrollableClass :>
  GTK_SCROLLABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a scrollable = unit
    type 'a class = 'a scrollable class
  end
