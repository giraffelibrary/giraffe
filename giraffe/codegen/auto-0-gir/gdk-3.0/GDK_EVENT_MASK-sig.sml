signature GDK_EVENT_MASK =
  sig
    include FLAGS
    val EXPOSURE_MASK : t
    val POINTER_MOTION_MASK : t
    val POINTER_MOTION_HINT_MASK : t
    val BUTTON_MOTION_MASK : t
    val BUTTON_1_MOTION_MASK : t
    val BUTTON_2_MOTION_MASK : t
    val BUTTON_3_MOTION_MASK : t
    val BUTTON_PRESS_MASK : t
    val BUTTON_RELEASE_MASK : t
    val KEY_PRESS_MASK : t
    val KEY_RELEASE_MASK : t
    val ENTER_NOTIFY_MASK : t
    val LEAVE_NOTIFY_MASK : t
    val FOCUS_CHANGE_MASK : t
    val STRUCTURE_MASK : t
    val PROPERTY_CHANGE_MASK : t
    val VISIBILITY_NOTIFY_MASK : t
    val PROXIMITY_IN_MASK : t
    val PROXIMITY_OUT_MASK : t
    val SUBSTRUCTURE_MASK : t
    val SCROLL_MASK : t
    val TOUCH_MASK : t
    val SMOOTH_SCROLL_MASK : t
    val TOUCHPAD_GESTURE_MASK : t
    val TABLET_PAD_MASK : t
    val ALL_EVENTS_MASK : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
