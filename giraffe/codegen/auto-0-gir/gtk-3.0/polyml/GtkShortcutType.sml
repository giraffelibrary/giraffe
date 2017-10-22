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
        exception Value of GInt.t
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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcut_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
