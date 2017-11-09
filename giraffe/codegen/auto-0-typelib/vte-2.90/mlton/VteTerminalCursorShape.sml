structure VteTerminalCursorShape :> VTE_TERMINAL_CURSOR_SHAPE =
  struct
    datatype enum =
      BLOCK
    | IBEAM
    | UNDERLINE
    structure Enum =
      Enum(
        type enum = enum
        val null = BLOCK
        val toInt =
          fn
            BLOCK => 0
          | IBEAM => 1
          | UNDERLINE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BLOCK
          | 1 => IBEAM
          | 2 => UNDERLINE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "vte_terminal_cursor_shape_get_type" : unit -> GObjectType.FFI.val_;
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
