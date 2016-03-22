structure GioFileInfoClass :>
  GIO_FILE_INFO_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_info = unit
    type 'a class = 'a file_info class
  end
