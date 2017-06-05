structure GdkEventKeyRecord :>
  GDK_EVENT_KEY_RECORD
    where type 'a event_union = 'a GdkEvent.union
    where type C.notnull = GdkEvent.C.notnull
    where type 'a C.p = 'a GdkEvent.C.p
    where type 'a window_class = 'a GdkWindowClass.class
    where type modifier_type_t = GdkModifierType.t =
  struct
    type 'a event_union = 'a GdkEvent.union
    open GdkEvent
    type key = unit
    type t = key union
    datatype event =
      KEY_PRESS
    | KEY_RELEASE

    val getWindow_ = _import "giraffe_gdk_event_key_get_window" : FFI.notnull FFI.p -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;

    val getSendEvent_ = _import "giraffe_gdk_event_key_get_send_event" : FFI.notnull FFI.p -> GBool.FFI.val_;

    val getTime_ = _import "giraffe_gdk_event_key_get_time" : FFI.notnull FFI.p -> GUInt32.FFI.val_;

    val getState_ = _import "giraffe_gdk_event_key_get_state" : FFI.notnull FFI.p -> GdkModifierType.FFI.val_;

    val getKeyval_ = _import "giraffe_gdk_event_key_get_keyval" : FFI.notnull FFI.p -> GUInt32.FFI.val_;

    val getHardwareKeycode_ = _import "giraffe_gdk_event_key_get_hardware_keycode" : FFI.notnull FFI.p -> GUInt32.FFI.val_;

    val getGroup_ = _import "giraffe_gdk_event_key_get_group" : FFI.notnull FFI.p -> GUInt8.FFI.val_;

    val getIsModifier_ = _import "giraffe_gdk_event_key_get_is_modifier" : FFI.notnull FFI.p -> GBool.FFI.val_;

    type 'a window_class = 'a GdkWindowClass.class
    type modifier_type_t = GdkModifierType.t

    fun getWindow e = (FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getWindow_ e

    fun getSendEvent e = (FFI.withPtr ---> GBool.FFI.fromVal) getSendEvent_ e

    fun getTime e = (FFI.withPtr ---> GUInt32.FFI.fromVal) getTime_ e

    fun getState e = (FFI.withPtr ---> GdkModifierType.FFI.fromVal) getState_ e

    fun getKeyval e = (FFI.withPtr ---> GUInt32.FFI.fromVal) getKeyval_ e

    fun getHardwareKeycode e = (FFI.withPtr ---> GUInt32.FFI.fromVal) getHardwareKeycode_ e

    fun getGroup e = (FFI.withPtr ---> GUInt8.FFI.fromVal) getGroup_ e

    fun getIsModifier e = (FFI.withPtr ---> GBool.FFI.fromVal) getIsModifier_ e
  end
