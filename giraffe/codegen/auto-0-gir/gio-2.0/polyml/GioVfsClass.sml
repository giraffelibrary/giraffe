structure GioVfsClass :>
  GIO_VFS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a vfs = unit
    type 'a class = 'a vfs class
  end
