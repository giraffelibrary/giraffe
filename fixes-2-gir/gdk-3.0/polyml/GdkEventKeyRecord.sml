structure GdkEventKeyRecord :>
  GDK_EVENT_KEY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.opt = GdkEvent.C.opt
    where type C.non_opt = GdkEvent.C.non_opt
    where type 'a C.p = 'a GdkEvent.C.p
    where type 'a window_class = 'a GdkWindowClass.class
    where type modifier_type_t = GdkModifierType.t =
  struct
    type 'a event_union = 'a GdkEvent.union
    type key = unit
    type t = key GdkEvent.union
    structure Record = GdkEvent
    open Record
    datatype event =
      KEY_PRESS
    | KEY_RELEASE

    local
      open PolyMLFFI
    in
      val getWindow_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_window")
          (PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr);

      val getSendEvent_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_send_event")
          (PolyML.cPtr --> GBool.PolyML.cVal);

      val getTime_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_time")
          (PolyML.cPtr --> GUInt32.PolyML.cVal);

      val getState_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_state")
          (PolyML.cPtr --> GdkModifierType.PolyML.cVal);

      val getKeyval_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_keyval")
          (PolyML.cPtr --> GUInt32.PolyML.cVal);

      val getHardwareKeycode_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_hardware_keycode")
          (PolyML.cPtr --> GUInt32.PolyML.cVal);

      val getGroup_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_group")
          (PolyML.cPtr --> GUInt8.PolyML.cVal);

      val getIsModifier_ =
        call
          (getSymbol "giraffe_gdk_event_key_get_is_modifier")
          (PolyML.cPtr --> GBool.PolyML.cVal);
    end

    type 'a window_class = 'a GdkWindowClass.class
    type modifier_type_t = GdkModifierType.t

    fun getWindow e = (FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getWindow_ e

    fun getSendEvent e = (FFI.withPtr false ---> GBool.FFI.fromVal) getSendEvent_ e

    fun getTime e = (FFI.withPtr false ---> GUInt32.FFI.fromVal) getTime_ e

    fun getState e = (FFI.withPtr false ---> GdkModifierType.FFI.fromVal) getState_ e

    fun getKeyval e = (FFI.withPtr false ---> GUInt32.FFI.fromVal) getKeyval_ e

    fun getHardwareKeycode e = (FFI.withPtr false ---> GUInt32.FFI.fromVal) getHardwareKeycode_ e

    fun getGroup e = (FFI.withPtr false ---> GUInt8.FFI.fromVal) getGroup_ e

    fun getIsModifier e = (FFI.withPtr false ---> GBool.FFI.fromVal) getIsModifier_ e
  end
