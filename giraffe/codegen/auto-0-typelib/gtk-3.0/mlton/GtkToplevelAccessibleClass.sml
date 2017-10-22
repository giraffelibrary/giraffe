structure GtkToplevelAccessibleClass :>
  GTK_TOPLEVEL_ACCESSIBLE_CLASS
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    open AtkObjectClass
    type 'a toplevel_accessible = unit
    type 'a class = 'a toplevel_accessible class
  end
