signature GDK_EVENT_TYPE =
  sig
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
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
