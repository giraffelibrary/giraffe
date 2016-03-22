structure GioPermissionClass :>
  GIO_PERMISSION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a permission = unit
    type 'a class = 'a permission class
  end
