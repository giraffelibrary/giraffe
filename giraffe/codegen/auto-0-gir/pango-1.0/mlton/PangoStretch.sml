structure PangoStretch :> PANGO_STRETCH =
  struct
    datatype enum =
      ULTRA_CONDENSED
    | EXTRA_CONDENSED
    | CONDENSED
    | SEMI_CONDENSED
    | NORMAL
    | SEMI_EXPANDED
    | EXPANDED
    | EXTRA_EXPANDED
    | ULTRA_EXPANDED
    structure Enum =
      Enum(
        type enum = enum
        val null = ULTRA_CONDENSED
        val toInt =
          fn
            ULTRA_CONDENSED => 0
          | EXTRA_CONDENSED => 1
          | CONDENSED => 2
          | SEMI_CONDENSED => 3
          | NORMAL => 4
          | SEMI_EXPANDED => 5
          | EXPANDED => 6
          | EXTRA_EXPANDED => 7
          | ULTRA_EXPANDED => 8
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
    val getType_ = _import "pango_stretch_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
