structure GioFileIconClass :>
  GIO_FILE_ICON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_icon = unit
    type 'a class = 'a file_icon class
  end
