structure GioIconClass :>
  GIO_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a icon = unit
    type 'a class = 'a icon class
  end
