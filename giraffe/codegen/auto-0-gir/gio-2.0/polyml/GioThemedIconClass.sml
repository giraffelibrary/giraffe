structure GioThemedIconClass :>
  GIO_THEMED_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a themed_icon = unit
    type 'a class = 'a themed_icon class
  end
