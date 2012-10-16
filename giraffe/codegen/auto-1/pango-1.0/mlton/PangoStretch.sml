structure PangoStretch :>
  sig
    include PANGO_STRETCH
  end =
  struct
    datatype t =
      ULTRACONDENSED
    | EXTRACONDENSED
    | CONDENSED
    | SEMICONDENSED
    | NORMAL
    | SEMIEXPANDED
    | EXPANDED
    | EXTRAEXPANDED
    | ULTRAEXPANDED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ULTRACONDENSED => f 0
          | EXTRACONDENSED => f 1
          | CONDENSED => f 2
          | SEMICONDENSED => f 3
          | NORMAL => f 4
          | SEMIEXPANDED => f 5
          | EXPANDED => f 6
          | EXTRAEXPANDED => f 7
          | ULTRAEXPANDED => f 8
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ULTRACONDENSED
          | 1 => EXTRACONDENSED
          | 2 => CONDENSED
          | 3 => SEMICONDENSED
          | 4 => NORMAL
          | 5 => SEMIEXPANDED
          | 6 => EXPANDED
          | 7 => EXTRAEXPANDED
          | 8 => ULTRAEXPANDED
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
    val null = ULTRACONDENSED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
