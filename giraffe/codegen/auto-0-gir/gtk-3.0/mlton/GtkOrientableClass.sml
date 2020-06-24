structure GtkOrientableClass :>
  GTK_ORIENTABLE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a orientable = unit
    type 'a class = 'a orientable class
  end
