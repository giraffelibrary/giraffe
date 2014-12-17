structure GioSimplePermission :>
  GIO_SIMPLE_PERMISSION
    where type 'a class_t = 'a GioSimplePermissionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_permission_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_simple_permission_new") (FFI.Bool.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioSimplePermissionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new allowed = (FFI.Bool.C.withVal ---> GioSimplePermissionClass.C.fromPtr true) new_ allowed
  end
