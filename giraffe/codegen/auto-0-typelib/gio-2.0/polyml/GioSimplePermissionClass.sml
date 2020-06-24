structure GioSimplePermissionClass :>
  GIO_SIMPLE_PERMISSION_CLASS
    where type 'a permission_class = 'a GioPermissionClass.class
    where type C.opt = GioPermissionClass.C.opt
    where type C.non_opt = GioPermissionClass.C.non_opt
    where type 'a C.p = 'a GioPermissionClass.C.p =
  struct
    type 'a permission_class = 'a GioPermissionClass.class
    open GioPermissionClass
    type 'a simple_permission = unit
    type 'a class = 'a simple_permission class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_permission_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
