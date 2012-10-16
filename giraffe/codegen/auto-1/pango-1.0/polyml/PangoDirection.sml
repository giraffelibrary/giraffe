structure PangoDirection :>
  sig
    include PANGO_DIRECTION
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      LTR
    | RTL
    | TTBLTR
    | TTBRTL
    | WEAKLTR
    | WEAKRTL
    | NEUTRAL
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            LTR => f 0
          | RTL => f 1
          | TTBLTR => f 2
          | TTBRTL => f 3
          | WEAKLTR => f 4
          | WEAKRTL => f 5
          | NEUTRAL => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTBLTR
          | 3 => TTBRTL
          | 4 => WEAKLTR
          | 5 => WEAKRTL
          | 6 => NEUTRAL
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_direction_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
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
