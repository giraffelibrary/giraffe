structure GioSimplePermission :>
  GIO_SIMPLE_PERMISSION
    where type 'a class = 'a GioSimplePermissionClass.class =
  struct
    val getType_ = _import "g_simple_permission_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_simple_permission_new" : FFI.Bool.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GioSimplePermissionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new allowed = (FFI.Bool.C.withVal ---> GioSimplePermissionClass.C.fromPtr true) new_ allowed
  end
