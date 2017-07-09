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
    val ALL_EVENTS_MASK = 0w4194302
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
        ALL_EVENTS_MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_event_mask_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
