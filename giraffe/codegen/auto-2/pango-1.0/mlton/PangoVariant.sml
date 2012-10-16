structure PangoVariant :>
  sig
    include PANGO_VARIANT
  end =
  struct
    datatype t =
      NORMAL
    | SMALLCAPS
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NORMAL => f 0
          | SMALLCAPS => f 1
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NORMAL
          | 1 => SMALLCAPS
          | n => raise Value n
      end
    val getType_ = _import "pango_variant_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORMAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
