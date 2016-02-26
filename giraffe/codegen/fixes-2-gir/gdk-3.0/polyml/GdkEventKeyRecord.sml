structure GdkEventKeyRecord :>
  sig
    include GDK_EVENT_KEY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
      where type 'a window_class_t = 'a GdkWindowClass.t
      where type modifier_type_t = GdkModifierType.t

    structure PolyML :
      sig
        val cPtr : C.notnull C.p PolyMLFFI.conversion
        val cOptPtr : unit C.p PolyMLFFI.conversion
      end
  end =
  struct
    type key = unit
    type 'a event_t = 'a GdkEvent.t
    type t = key event_t


    datatype event =
      KEY_PRESS
    | KEY_RELEASE


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    local
      open PolyMLFFI
    in
      val getWindow_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_window")
          (PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr);

      val getSendEvent_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_send_event")
          (PolyML.cPtr --> FFI.Bool.PolyML.cVal);

      val getTime_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_time")
          (PolyML.cPtr --> FFI.UInt32.PolyML.cVal);

      val getState_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_state")
          (PolyML.cPtr --> GdkModifierType.PolyML.cVal);

      val getKeyval_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_keyval")
          (PolyML.cPtr --> FFI.UInt32.PolyML.cVal);

      val getHardwareKeycode_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_hardware_keycode")
          (PolyML.cPtr --> FFI.UInt32.PolyML.cVal);

      val getGroup_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_group")
          (PolyML.cPtr --> FFI.UInt8.PolyML.cVal);

      val getIsModifier_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_is_modifier")
          (PolyML.cPtr --> FFI.Bool.PolyML.cVal);
    end


    type 'a window_class_t = 'a GdkWindowClass.t
    type modifier_type_t = GdkModifierType.t


    fun getWindow e = (C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ e

    fun getSendEvent e = (C.withPtr ---> FFI.Bool.C.fromVal) getSendEvent_ e

    fun getTime e = (C.withPtr ---> FFI.UInt32.C.fromVal) getTime_ e

    fun getState e = (C.withPtr ---> GdkModifierType.C.fromVal) getState_ e

    fun getKeyval e = (C.withPtr ---> FFI.UInt32.C.fromVal) getKeyval_ e

    fun getHardwareKeycode e = (C.withPtr ---> FFI.UInt32.C.fromVal) getHardwareKeycode_ e

    fun getGroup e = (C.withPtr ---> FFI.UInt8.C.fromVal) getGroup_ e

    fun getIsModifier e = (C.withPtr ---> FFI.Bool.C.fromVal) getIsModifier_ e


    val t = GdkEvent.t
  end
