structure GioBytesIconClass :>
  GIO_BYTES_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a bytes_icon = unit
    type 'a class = 'a bytes_icon class
  end
