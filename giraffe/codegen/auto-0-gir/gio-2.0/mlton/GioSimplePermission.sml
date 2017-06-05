structure GioSimplePermission :>
  GIO_SIMPLE_PERMISSION
    where type 'a class = 'a GioSimplePermissionClass.class =
  struct
    val getType_ = _import "g_simple_permission_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_simple_permission_new" : GBool.FFI.val_ -> GioPermissionClass.FFI.notnull GioPermissionClass.FFI.p;
    type 'a class = 'a GioSimplePermissionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new allowed = (GBool.FFI.withVal ---> GioSimplePermissionClass.FFI.fromPtr true) new_ allowed
  end
