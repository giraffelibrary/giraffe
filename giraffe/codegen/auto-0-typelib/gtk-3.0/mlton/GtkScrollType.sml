structure GtkScrollType :> GTK_SCROLL_TYPE =
  struct
    datatype enum =
      NONE
    | JUMP
    | STEP_BACKWARD
    | STEP_FORWARD
    | PAGE_BACKWARD
    | PAGE_FORWARD
    | STEP_UP
    | STEP_DOWN
    | PAGE_UP
    | PAGE_DOWN
    | STEP_LEFT
    | STEP_RIGHT
    | PAGE_LEFT
    | PAGE_RIGHT
    | START
    | END
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | JUMP => 1
          | STEP_BACKWARD => 2
          | STEP_FORWARD => 3
          | PAGE_BACKWARD => 4
          | PAGE_FORWARD => 5
          | STEP_UP => 6
          | STEP_DOWN => 7
          | PAGE_UP => 8
          | PAGE_DOWN => 9
          | STEP_LEFT => 10
          | STEP_RIGHT => 11
          | PAGE_LEFT => 12
          | PAGE_RIGHT => 13
          | START => 14
          | END => 15
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => JUMP
          | 2 => STEP_BACKWARD
          | 3 => STEP_FORWARD
          | 4 => PAGE_BACKWARD
          | 5 => PAGE_FORWARD
          | 6 => STEP_UP
          | 7 => STEP_DOWN
          | 8 => PAGE_UP
          | 9 => PAGE_DOWN
          | 10 => STEP_LEFT
          | 11 => STEP_RIGHT
          | 12 => PAGE_LEFT
          | 13 => PAGE_RIGHT
          | 14 => START
          | 15 => END
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_scroll_type_get_type" : unit -> GObjectType.FFI.val_;
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
