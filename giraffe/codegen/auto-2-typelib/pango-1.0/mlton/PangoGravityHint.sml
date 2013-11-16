structure PangoGravityHint :>
  sig
    include PANGO_GRAVITY_HINT
  end =
  struct
    datatype t =
      NATURAL
    | STRONG
    | LINE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NATURAL => f 0
          | STRONG => f 1
          | LINE => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NATURAL
          | 1 => STRONG
          | 2 => LINE
          | n => raise Value n
      end
    val getType_ = _import "pango_gravity_hint_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NATURAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
