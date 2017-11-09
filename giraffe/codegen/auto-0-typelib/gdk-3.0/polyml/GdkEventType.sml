structure GdkEventType :> GDK_EVENT_TYPE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = NOTHING
        val toInt =
          fn
            NOTHING => ~1
          | DELETE => 0
          | DESTROY => 1
          | EXPOSE => 2
          | MOTION_NOTIFY => 3
          | BUTTON_PRESS => 4
          | DOUBLE_BUTTON_PRESS => 5
          | TRIPLE_BUTTON_PRESS => 6
          | BUTTON_RELEASE => 7
          | KEY_PRESS => 8
          | KEY_RELEASE => 9
          | ENTER_NOTIFY => 10
          | LEAVE_NOTIFY => 11
          | FOCUS_CHANGE => 12
          | CONFIGURE => 13
          | MAP => 14
          | UNMAP => 15
          | PROPERTY_NOTIFY => 16
          | SELECTION_CLEAR => 17
          | SELECTION_REQUEST => 18
          | SELECTION_NOTIFY => 19
          | PROXIMITY_IN => 20
          | PROXIMITY_OUT => 21
          | DRAG_ENTER => 22
          | DRAG_LEAVE => 23
          | DRAG_MOTION => 24
          | DRAG_STATUS => 25
          | DROP_START => 26
          | DROP_FINISHED => 27
          | CLIENT_EVENT => 28
          | VISIBILITY_NOTIFY => 29
          | SCROLL => 31
          | WINDOW_STATE => 32
          | SETTING => 33
          | OWNER_CHANGE => 34
          | GRAB_BROKEN => 35
          | DAMAGE => 36
          | EVENT_LAST => 37
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_event_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
