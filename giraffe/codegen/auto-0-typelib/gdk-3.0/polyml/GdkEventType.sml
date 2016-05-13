structure GdkEventType :>
  sig
    include GDK_EVENT_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NOTHING
    | DELETE
    | DESTROY
    | EXPOSE
    | MOTION_NOTIFY
    | BUTTON_PRESS
    | DOUBLE_BUTTON_PRESS
    | TRIPLE_BUTTON_PRESS
    | BUTTON_RELEASE
    | KEY_PRESS
    | KEY_RELEASE
    | ENTER_NOTIFY
    | LEAVE_NOTIFY
    | FOCUS_CHANGE
    | CONFIGURE
    | MAP
    | UNMAP
    | PROPERTY_NOTIFY
    | SELECTION_CLEAR
    | SELECTION_REQUEST
    | SELECTION_NOTIFY
    | PROXIMITY_IN
    | PROXIMITY_OUT
    | DRAG_ENTER
    | DRAG_LEAVE
    | DRAG_MOTION
    | DRAG_STATUS
    | DROP_START
    | DROP_FINISHED
    | CLIENT_EVENT
    | VISIBILITY_NOTIFY
    | SCROLL
    | WINDOW_STATE
    | SETTING
    | OWNER_CHANGE
    | GRAB_BROKEN
    | DAMAGE
    | EVENT_LAST
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NOTHING => f ~1
          | DELETE => f 0
          | DESTROY => f 1
          | EXPOSE => f 2
          | MOTION_NOTIFY => f 3
          | BUTTON_PRESS => f 4
          | DOUBLE_BUTTON_PRESS => f 5
          | TRIPLE_BUTTON_PRESS => f 6
          | BUTTON_RELEASE => f 7
          | KEY_PRESS => f 8
          | KEY_RELEASE => f 9
          | ENTER_NOTIFY => f 10
          | LEAVE_NOTIFY => f 11
          | FOCUS_CHANGE => f 12
          | CONFIGURE => f 13
          | MAP => f 14
          | UNMAP => f 15
          | PROPERTY_NOTIFY => f 16
          | SELECTION_CLEAR => f 17
          | SELECTION_REQUEST => f 18
          | SELECTION_NOTIFY => f 19
          | PROXIMITY_IN => f 20
          | PROXIMITY_OUT => f 21
          | DRAG_ENTER => f 22
          | DRAG_LEAVE => f 23
          | DRAG_MOTION => f 24
          | DRAG_STATUS => f 25
          | DROP_START => f 26
          | DROP_FINISHED => f 27
          | CLIENT_EVENT => f 28
          | VISIBILITY_NOTIFY => f 29
          | SCROLL => f 31
          | WINDOW_STATE => f 32
          | SETTING => f 33
          | OWNER_CHANGE => f 34
          | GRAB_BROKEN => f 35
          | DAMAGE => f 36
          | EVENT_LAST => f 37
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            ~1 => NOTHING
          | 0 => DELETE
          | 1 => DESTROY
          | 2 => EXPOSE
          | 3 => MOTION_NOTIFY
          | 4 => BUTTON_PRESS
          | 5 => DOUBLE_BUTTON_PRESS
          | 6 => TRIPLE_BUTTON_PRESS
          | 7 => BUTTON_RELEASE
          | 8 => KEY_PRESS
          | 9 => KEY_RELEASE
          | 10 => ENTER_NOTIFY
          | 11 => LEAVE_NOTIFY
          | 12 => FOCUS_CHANGE
          | 13 => CONFIGURE
          | 14 => MAP
          | 15 => UNMAP
          | 16 => PROPERTY_NOTIFY
          | 17 => SELECTION_CLEAR
          | 18 => SELECTION_REQUEST
          | 19 => SELECTION_NOTIFY
          | 20 => PROXIMITY_IN
          | 21 => PROXIMITY_OUT
          | 22 => DRAG_ENTER
          | 23 => DRAG_LEAVE
          | 24 => DRAG_MOTION
          | 25 => DRAG_STATUS
          | 26 => DROP_START
          | 27 => DROP_FINISHED
          | 28 => CLIENT_EVENT
          | 29 => VISIBILITY_NOTIFY
          | 31 => SCROLL
          | 32 => WINDOW_STATE
          | 33 => SETTING
          | 34 => OWNER_CHANGE
          | 35 => GRAB_BROKEN
          | 36 => DAMAGE
          | 37 => EVENT_LAST
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_event_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NOTHING
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
