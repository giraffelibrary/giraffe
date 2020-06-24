structure GtkShortcutType :> GTK_SHORTCUT_TYPE =
  struct
    datatype enum =
      ACCELERATOR
    | GESTURE_PINCH
    | GESTURE_STRETCH
    | GESTURE_ROTATE_CLOCKWISE
    | GESTURE_ROTATE_COUNTERCLOCKWISE
    | GESTURE_TWO_FINGER_SWIPE_LEFT
    | GESTURE_TWO_FINGER_SWIPE_RIGHT
    | GESTURE
    structure Enum =
      Enum(
        type enum = enum
        val null = ACCELERATOR
        val toInt =
          fn
            ACCELERATOR => 0
          | GESTURE_PINCH => 1
          | GESTURE_STRETCH => 2
          | GESTURE_ROTATE_CLOCKWISE => 3
          | GESTURE_ROTATE_COUNTERCLOCKWISE => 4
          | GESTURE_TWO_FINGER_SWIPE_LEFT => 5
          | GESTURE_TWO_FINGER_SWIPE_RIGHT => 6
          | GESTURE => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ACCELERATOR
          | 1 => GESTURE_PINCH
          | 2 => GESTURE_STRETCH
          | 3 => GESTURE_ROTATE_CLOCKWISE
          | 4 => GESTURE_ROTATE_COUNTERCLOCKWISE
          | 5 => GESTURE_TWO_FINGER_SWIPE_LEFT
          | 6 => GESTURE_TWO_FINGER_SWIPE_RIGHT
          | 7 => GESTURE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_shortcut_type_get_type" : unit -> GObjectType.FFI.val_;
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
