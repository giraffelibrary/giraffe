structure PangoWeight :> PANGO_WEIGHT =
  struct
    datatype enum =
      THIN
    | ULTRALIGHT
    | LIGHT
    | SEMILIGHT
    | BOOK
    | NORMAL
    | MEDIUM
    | SEMIBOLD
    | BOLD
    | ULTRABOLD
    | HEAVY
    | ULTRAHEAVY
    structure Enum =
      Enum(
        type enum = enum
        val null = THIN
        val toInt =
          fn
            THIN => 100
          | ULTRALIGHT => 200
          | LIGHT => 300
          | SEMILIGHT => 350
          | BOOK => 380
          | NORMAL => 400
          | MEDIUM => 500
          | SEMIBOLD => 600
          | BOLD => 700
          | ULTRABOLD => 800
          | HEAVY => 900
          | ULTRAHEAVY => 1000
        exception Value of GInt.t
        val fromInt =
          fn
            100 => THIN
          | 200 => ULTRALIGHT
          | 300 => LIGHT
          | 350 => SEMILIGHT
          | 380 => BOOK
          | 400 => NORMAL
          | 500 => MEDIUM
          | 600 => SEMIBOLD
          | 700 => BOLD
          | 800 => ULTRABOLD
          | 900 => HEAVY
          | 1000 => ULTRAHEAVY
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "pango_weight_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
