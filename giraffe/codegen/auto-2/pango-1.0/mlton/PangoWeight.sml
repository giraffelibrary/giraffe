structure PangoWeight :>
  sig
    include PANGO_WEIGHT
  end =
  struct
    datatype t =
      THIN
    | ULTRALIGHT
    | LIGHT
    | BOOK
    | NORMAL
    | MEDIUM
    | SEMIBOLD
    | BOLD
    | ULTRABOLD
    | HEAVY
    | ULTRAHEAVY
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            THIN => f 100
          | ULTRALIGHT => f 200
          | LIGHT => f 300
          | BOOK => f 380
          | NORMAL => f 400
          | MEDIUM => f 500
          | SEMIBOLD => f 600
          | BOLD => f 700
          | ULTRABOLD => f 800
          | HEAVY => f 900
          | ULTRAHEAVY => f 1000
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            100 => THIN
          | 200 => ULTRALIGHT
          | 300 => LIGHT
          | 380 => BOOK
          | 400 => NORMAL
          | 500 => MEDIUM
          | 600 => SEMIBOLD
          | 700 => BOLD
          | 800 => ULTRABOLD
          | 900 => HEAVY
          | 1000 => ULTRAHEAVY
          | n => raise Value n
      end
    val getType_ = _import "pango_weight_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = THIN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
