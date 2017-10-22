signature GTK_SHORTCUT_TYPE =
  sig
    datatype enum =
      ACCELERATOR
    | GESTURE_PINCH
    | GESTURE_STRETCH
    | GESTURE_ROTATE_CLOCKWISE
    | GESTURE_ROTATE_COUNTERCLOCKWISE
    | GESTURE_TWO_FINGER_SWIPE_LEFT
    | GESTURE_TWO_FINGER_SWIPE_RIGHT
    | GESTURE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
