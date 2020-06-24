structure VteEraseBinding :> VTE_ERASE_BINDING =
  struct
    datatype enum =
      AUTO
    | ASCII_BACKSPACE
    | ASCII_DELETE
    | DELETE_SEQUENCE
    | TTY
    structure Enum =
      Enum(
        type enum = enum
        val null = AUTO
        val toInt =
          fn
            AUTO => 0
          | ASCII_BACKSPACE => 1
          | ASCII_DELETE => 2
          | DELETE_SEQUENCE => 3
          | TTY => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => AUTO
          | 1 => ASCII_BACKSPACE
          | 2 => ASCII_DELETE
          | 3 => DELETE_SEQUENCE
          | 4 => TTY
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "vte_erase_binding_get_type" : unit -> GObjectType.FFI.val_;
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
