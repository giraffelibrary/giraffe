structure GtkStatusIconClass :>
  GTK_STATUS_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a status_icon = unit
    type 'a class = 'a status_icon class
  end
