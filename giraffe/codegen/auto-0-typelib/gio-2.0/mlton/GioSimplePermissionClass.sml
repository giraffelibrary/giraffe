structure GioSimplePermissionClass :>
  GIO_SIMPLE_PERMISSION_CLASS
    where type 'a permission_class_t = 'a GioPermissionClass.t
    where type C.notnull = GioPermissionClass.C.notnull
    where type 'a C.p = 'a GioPermissionClass.C.p =
  struct
    type 'a simple_permission = unit
    type 'a permission_class_t = 'a GioPermissionClass.t
    type 'a t = 'a simple_permission permission_class_t
    fun toBase obj = obj
    val t = GioPermissionClass.t
    val tOpt = GioPermissionClass.tOpt
    structure C = GioPermissionClass.C
  end
