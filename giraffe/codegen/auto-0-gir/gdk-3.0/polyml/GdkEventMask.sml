structure GdkEventMask :>
  sig
    include GDK_EVENT_MASK
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
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
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val cVal = FFI.Flags.PolyML.cVal
        val cRef = FFI.Flags.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_event_mask_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
