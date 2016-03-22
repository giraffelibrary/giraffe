structure GtkNumerableIconClass :>
  GTK_NUMERABLE_ICON_CLASS
    where type C.notnull = GioEmblemedIconClass.C.notnull
    where type 'a C.p = 'a GioEmblemedIconClass.C.p =
  struct
    open GioEmblemedIconClass
    type 'a numerable_icon = unit
    type 'a class = 'a numerable_icon class
  end
