structure GdkNotifyType :>
  sig
    include GDK_NOTIFY_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      ANCESTOR
    | VIRTUAL
    | INFERIOR
    | NONLINEAR
    | NONLINEAR_VIRTUAL
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ANCESTOR => f 0
          | VIRTUAL => f 1
          | INFERIOR => f 2
          | NONLINEAR => f 3
          | NONLINEAR_VIRTUAL => f 4
          | UNKNOWN => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ANCESTOR
          | 1 => VIRTUAL
          | 2 => INFERIOR
          | 3 => NONLINEAR
          | 4 => NONLINEAR_VIRTUAL
          | 5 => UNKNOWN
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
      val getType_ = call (load_sym libgdk "gdk_notify_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ANCESTOR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
