structure PangoDirection :>
  sig
    include PANGO_DIRECTION
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      LTR
    | RTL
    | TTB_LTR
    | TTB_RTL
    | WEAK_LTR
    | WEAK_RTL
    | NEUTRAL
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LTR => f 0
          | RTL => f 1
          | TTB_LTR => f 2
          | TTB_RTL => f 3
          | WEAK_LTR => f 4
          | WEAK_RTL => f 5
          | NEUTRAL => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTB_LTR
          | 3 => TTB_RTL
          | 4 => WEAK_LTR
          | 5 => WEAK_RTL
          | 6 => NEUTRAL
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
      val getType_ = call (load_sym libpango "pango_direction_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = LTR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
