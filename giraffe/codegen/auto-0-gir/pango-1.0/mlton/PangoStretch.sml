structure PangoStretch :>
  sig
    include PANGO_STRETCH
  end =
  struct
    datatype t =
      ULTRA_CONDENSED
    | EXTRA_CONDENSED
    | CONDENSED
    | SEMI_CONDENSED
    | NORMAL
    | SEMI_EXPANDED
    | EXPANDED
    | EXTRA_EXPANDED
    | ULTRA_EXPANDED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ULTRA_CONDENSED => f 0
          | EXTRA_CONDENSED => f 1
          | CONDENSED => f 2
          | SEMI_CONDENSED => f 3
          | NORMAL => f 4
          | SEMI_EXPANDED => f 5
          | EXPANDED => f 6
          | EXTRA_EXPANDED => f 7
          | ULTRA_EXPANDED => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ULTRA_CONDENSED
          | 1 => EXTRA_CONDENSED
          | 2 => CONDENSED
          | 3 => SEMI_CONDENSED
          | 4 => NORMAL
          | 5 => SEMI_EXPANDED
          | 6 => EXPANDED
          | 7 => EXTRA_EXPANDED
          | 8 => ULTRA_EXPANDED
          | n => raise Value n
      end
    val getType_ = _import "pango_stretch_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ULTRA_CONDENSED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
