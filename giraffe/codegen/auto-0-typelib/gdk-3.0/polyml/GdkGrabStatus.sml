structure GdkGrabStatus :>
  sig
    include GDK_GRAB_STATUS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      SUCCESS
    | ALREADY_GRABBED
    | INVALID_TIME
    | NOT_VIEWABLE
    | FROZEN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SUCCESS => f 0
          | ALREADY_GRABBED => f 1
          | INVALID_TIME => f 2
          | NOT_VIEWABLE => f 3
          | FROZEN => f 4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SUCCESS
          | 1 => ALREADY_GRABBED
          | 2 => INVALID_TIME
          | 3 => NOT_VIEWABLE
          | 4 => FROZEN
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_grab_status_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SUCCESS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
