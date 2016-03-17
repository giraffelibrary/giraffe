structure GioSimplePermission :>
  GIO_SIMPLE_PERMISSION
    where type 'a class = 'a GioSimplePermissionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_permission_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_simple_permission_new") (FFI.Bool.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioSimplePermissionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new allowed = (FFI.Bool.C.withVal ---> GioSimplePermissionClass.C.fromPtr true) new_ allowed
  end
