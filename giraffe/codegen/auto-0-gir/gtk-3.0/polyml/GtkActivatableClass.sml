structure GtkActivatableClass :>
  GTK_ACTIVATABLE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a activatable = unit
    type 'a class = 'a activatable class
  end
