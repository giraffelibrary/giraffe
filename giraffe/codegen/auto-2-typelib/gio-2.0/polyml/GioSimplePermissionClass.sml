structure GioSimplePermissionClass :>
  GIO_SIMPLE_PERMISSION_CLASS
    where type 'a permissionclass_t = 'a GioPermissionClass.t
    where type C.notnull = GioPermissionClass.C.notnull
    where type 'a C.p = 'a GioPermissionClass.C.p =
  struct
    type 'a simplepermission = unit
    type 'a permissionclass_t = 'a GioPermissionClass.t
    type 'a t = 'a simplepermission permissionclass_t
    fun toBase obj = obj
    val t = GioPermissionClass.t
    val tOpt = GioPermissionClass.tOpt
    structure C = GioPermissionClass.C
  end
