structure GtkAccessibleClass :>
  GTK_ACCESSIBLE_CLASS
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    open AtkObjectClass
    type 'a accessible = unit
    type 'a class = 'a accessible class
  end
