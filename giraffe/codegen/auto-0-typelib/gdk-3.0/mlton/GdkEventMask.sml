structure GdkEventMask :> GDK_EVENT_MASK =
  struct
    val EXPOSURE_MASK = 0w2
    val POINTER_MOTION_MASK = 0w4
    val POINTER_MOTION_HINT_MASK = 0w8
    val BUTTON_MOTION_MASK = 0w16
    val BUTTON_1_MOTION_MASK = 0w32
    val BUTTON_2_MOTION_MASK = 0w64
    val BUTTON_3_MOTION_MASK = 0w128
    val BUTTON_PRESS_MASK = 0w256
    val BUTTON_RELEASE_MASK = 0w512
    val KEY_PRESS_MASK = 0w1024
    val KEY_RELEASE_MASK = 0w2048
    val ENTER_NOTIFY_MASK = 0w4096
    val LEAVE_NOTIFY_MASK = 0w8192
    val FOCUS_CHANGE_MASK = 0w16384
    val STRUCTURE_MASK = 0w32768
    val PROPERTY_CHANGE_MASK = 0w65536
    val VISIBILITY_NOTIFY_MASK = 0w131072
    val PROXIMITY_IN_MASK = 0w262144
    val PROXIMITY_OUT_MASK = 0w524288
    val SUBSTRUCTURE_MASK = 0w1048576
    val SCROLL_MASK = 0w2097152
    val TOUCH_MASK = 0w4194304
    val SMOOTH_SCROLL_MASK = 0w8388608
    val TOUCHPAD_GESTURE_MASK = 0w16777216
    val TABLET_PAD_MASK = 0w33554432
    val ALL_EVENTS_MASK = 0w16777214
    val allFlags =
      [
        EXPOSURE_MASK,
        POINTER_MOTION_MASK,
        POINTER_MOTION_HINT_MASK,
        BUTTON_MOTION_MASK,
        BUTTON_1_MOTION_MASK,
        BUTTON_2_MOTION_MASK,
        BUTTON_3_MOTION_MASK,
        BUTTON_PRESS_MASK,
        BUTTON_RELEASE_MASK,
        KEY_PRESS_MASK,
        KEY_RELEASE_MASK,
        ENTER_NOTIFY_MASK,
        LEAVE_NOTIFY_MASK,
        FOCUS_CHANGE_MASK,
        STRUCTURE_MASK,
        PROPERTY_CHANGE_MASK,
        VISIBILITY_NOTIFY_MASK,
        PROXIMITY_IN_MASK,
        PROXIMITY_OUT_MASK,
        SUBSTRUCTURE_MASK,
        SCROLL_MASK,
        TOUCH_MASK,
        SMOOTH_SCROLL_MASK,
        TOUCHPAD_GESTURE_MASK,
        TABLET_PAD_MASK,
        ALL_EVENTS_MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_event_mask_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
