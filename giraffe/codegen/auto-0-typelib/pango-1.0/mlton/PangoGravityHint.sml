structure PangoGravityHint :> PANGO_GRAVITY_HINT =
  struct
    datatype enum =
      NATURAL
    | STRONG
    | LINE
    structure Enum =
      Enum(
        type enum = enum
        val null = NATURAL
        val toInt =
          fn
            NATURAL => 0
          | STRONG => 1
          | LINE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NATURAL
          | 1 => STRONG
          | 2 => LINE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "pango_gravity_hint_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
