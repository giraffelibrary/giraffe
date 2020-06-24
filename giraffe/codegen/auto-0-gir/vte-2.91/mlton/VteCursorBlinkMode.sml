structure VteCursorBlinkMode :> VTE_CURSOR_BLINK_MODE =
  struct
    datatype enum =
      SYSTEM
    | ON
    | OFF
    structure Enum =
      Enum(
        type enum = enum
        val null = SYSTEM
        val toInt =
          fn
            SYSTEM => 0
          | ON => 1
          | OFF => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SYSTEM
          | 1 => ON
          | 2 => OFF
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "vte_cursor_blink_mode_get_type" : unit -> GObjectType.FFI.val_;
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
