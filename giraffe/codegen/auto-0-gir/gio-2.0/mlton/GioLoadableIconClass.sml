structure GioLoadableIconClass :>
  GIO_LOADABLE_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a loadable_icon = unit
    type 'a class = 'a loadable_icon class
  end
