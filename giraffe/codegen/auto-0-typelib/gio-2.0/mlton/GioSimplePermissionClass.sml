structure GioSimplePermissionClass :>
  GIO_SIMPLE_PERMISSION_CLASS
    where type 'a permission_class = 'a GioPermissionClass.class
    where type C.notnull = GioPermissionClass.C.notnull
    where type 'a C.p = 'a GioPermissionClass.C.p =
  struct
    type 'a permission_class = 'a GioPermissionClass.class
    open GioPermissionClass
    type 'a simple_permission = unit
    type 'a class = 'a simple_permission class
  end
