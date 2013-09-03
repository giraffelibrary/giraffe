structure GdkEventKeyRecord :>
  sig
    include GDK_EVENT_KEY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
      where type 'a windowclass_t = 'a GdkWindowClass.t
      where type modifiertype_t = GdkModifierType.t
  end =
  struct
    type key = unit
    type 'a event_t = 'a GdkEvent.t
    type t = key event_t


    datatype event =
      KEYPRESS
    | KEYRELEASE


    structure C = GdkEvent.C


    val getWindow_ = _import "giraffe_gdk_event_key_get_window" : C.notnull C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;

    val getSendEvent_ = _import "giraffe_gdk_event_key_get_send_event" : C.notnull C.p -> FFI.Bool.val_;

    val getTime_ = _import "giraffe_gdk_event_key_get_time" : C.notnull C.p -> FFI.UInt32.val_;

    val getState_ = _import "giraffe_gdk_event_key_get_state" : C.notnull C.p -> GdkModifierType.C.val_;

    val getKeyval_ = _import "giraffe_gdk_event_key_get_keyval" : C.notnull C.p -> FFI.UInt32.val_;

    val getHardwareKeycode_ = _import "giraffe_gdk_event_key_get_hardware_keycode" : C.notnull C.p -> FFI.UInt32.val_;

    val getGroup_ = _import "giraffe_gdk_event_key_get_group" : C.notnull C.p -> FFI.UInt8.val_;

    val getIsModifier_ = _import "giraffe_gdk_event_key_get_is_modifier" : C.notnull C.p -> FFI.Bool.val_;


    type 'a windowclass_t = 'a GdkWindowClass.t
    type modifiertype_t = GdkModifierType.t


    fun getWindow e = (C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ e

    fun getSendEvent e = (C.withPtr ---> FFI.Bool.fromVal) getSendEvent_ e

    fun getTime e = (C.withPtr ---> FFI.UInt32.fromVal) getTime_ e

    fun getState e = (C.withPtr ---> GdkModifierType.C.fromVal) getState_ e

    fun getKeyval e = (C.withPtr ---> FFI.UInt32.fromVal) getKeyval_ e

    fun getHardwareKeycode e = (C.withPtr ---> FFI.UInt32.fromVal) getHardwareKeycode_ e

    fun getGroup e = (C.withPtr ---> FFI.UInt8.fromVal) getGroup_ e

    fun getIsModifier e = (C.withPtr ---> FFI.Bool.fromVal) getIsModifier_ e


    val t = GdkEvent.t
  end
