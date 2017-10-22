structure GtkIconInfoClass :>
  GTK_ICON_INFO_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a icon_info = unit
    type 'a class = 'a icon_info class
  end
