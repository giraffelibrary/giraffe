structure GdkTouchpadGesturePhase :> GDK_TOUCHPAD_GESTURE_PHASE =
  struct
    datatype enum =
      BEGIN
    | UPDATE
    | END
    | CANCEL
    structure Enum =
      Enum(
        type enum = enum
        val null = BEGIN
        val toInt =
          fn
            BEGIN => 0
          | UPDATE => 1
          | END => 2
          | CANCEL => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BEGIN
          | 1 => UPDATE
          | 2 => END
          | 3 => CANCEL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_touchpad_gesture_phase_get_type" : unit -> GObjectType.FFI.val_;
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
