structure GtkStackTransitionType :> GTK_STACK_TRANSITION_TYPE =
  struct
    datatype enum =
      NONE
    | CROSSFADE
    | SLIDE_RIGHT
    | SLIDE_LEFT
    | SLIDE_UP
    | SLIDE_DOWN
    | SLIDE_LEFT_RIGHT
    | SLIDE_UP_DOWN
    | OVER_UP
    | OVER_DOWN
    | OVER_LEFT
    | OVER_RIGHT
    | UNDER_UP
    | UNDER_DOWN
    | UNDER_LEFT
    | UNDER_RIGHT
    | OVER_UP_DOWN
    | OVER_DOWN_UP
    | OVER_LEFT_RIGHT
    | OVER_RIGHT_LEFT
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CROSSFADE => 1
          | SLIDE_RIGHT => 2
          | SLIDE_LEFT => 3
          | SLIDE_UP => 4
          | SLIDE_DOWN => 5
          | SLIDE_LEFT_RIGHT => 6
          | SLIDE_UP_DOWN => 7
          | OVER_UP => 8
          | OVER_DOWN => 9
          | OVER_LEFT => 10
          | OVER_RIGHT => 11
          | UNDER_UP => 12
          | UNDER_DOWN => 13
          | UNDER_LEFT => 14
          | UNDER_RIGHT => 15
          | OVER_UP_DOWN => 16
          | OVER_DOWN_UP => 17
          | OVER_LEFT_RIGHT => 18
          | OVER_RIGHT_LEFT => 19
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CROSSFADE
          | 2 => SLIDE_RIGHT
          | 3 => SLIDE_LEFT
          | 4 => SLIDE_UP
          | 5 => SLIDE_DOWN
          | 6 => SLIDE_LEFT_RIGHT
          | 7 => SLIDE_UP_DOWN
          | 8 => OVER_UP
          | 9 => OVER_DOWN
          | 10 => OVER_LEFT
          | 11 => OVER_RIGHT
          | 12 => UNDER_UP
          | 13 => UNDER_DOWN
          | 14 => UNDER_LEFT
          | 15 => UNDER_RIGHT
          | 16 => OVER_UP_DOWN
          | 17 => OVER_DOWN_UP
          | 18 => OVER_LEFT_RIGHT
          | 19 => OVER_RIGHT_LEFT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_stack_transition_type_get_type" : unit -> GObjectType.FFI.val_;
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
