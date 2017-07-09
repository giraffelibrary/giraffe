structure GioSimplePermission :>
  GIO_SIMPLE_PERMISSION
    where type 'a class = 'a GioSimplePermissionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_permission_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_simple_permission_new") (GBool.PolyML.cVal --> GioPermissionClass.PolyML.cPtr)
    end
    type 'a class = 'a GioSimplePermissionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new allowed = (GBool.FFI.withVal ---> GioSimplePermissionClass.FFI.fromPtr true) new_ allowed
  end
