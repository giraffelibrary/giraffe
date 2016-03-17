structure GioSimplePermissionClass :>
  GIO_SIMPLE_PERMISSION_CLASS
    where type 'a permission_class = 'a GioPermissionClass.class
    where type C.notnull = GioPermissionClass.C.notnull
    where type 'a C.p = 'a GioPermissionClass.C.p =
  struct
    type 'a simple_permission = unit
    type 'a permission_class = 'a GioPermissionClass.class
    type 'a class = 'a simple_permission permission_class
    type t = base class
    fun toBase obj = obj
    val t = GioPermissionClass.t
    val tOpt = GioPermissionClass.tOpt
    structure C = GioPermissionClass.C
  end
