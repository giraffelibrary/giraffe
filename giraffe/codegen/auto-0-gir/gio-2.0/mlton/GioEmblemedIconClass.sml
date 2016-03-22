structure GioEmblemedIconClass :>
  GIO_EMBLEMED_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a emblemed_icon = unit
    type 'a class = 'a emblemed_icon class
  end
