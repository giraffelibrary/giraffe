structure GtkRevealerTransitionType :> GTK_REVEALER_TRANSITION_TYPE =
  struct
    datatype enum =
      NONE
    | CROSSFADE
    | SLIDE_RIGHT
    | SLIDE_LEFT
    | SLIDE_UP
    | SLIDE_DOWN
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
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CROSSFADE
          | 2 => SLIDE_RIGHT
          | 3 => SLIDE_LEFT
          | 4 => SLIDE_UP
          | 5 => SLIDE_DOWN
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_revealer_transition_type_get_type" : unit -> GObjectType.FFI.val_;
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
