structure GdkEventKeyRecord :>
  sig
    include GDK_EVENT_KEY_RECORD
      where type 'a event_t = 'a GdkEvent.t
      where type C.notnull = GdkEvent.C.notnull
      where type 'a C.p = 'a GdkEvent.C.p
      where type 'a windowclass_t = 'a GdkWindowClass.t
      where type modifiertype_t = GdkModifierType.t

    structure PolyML :
      sig
        val PTR : C.notnull C.p CInterface.Conversion
        val OPTPTR : unit C.p CInterface.Conversion
      end
  end =
  struct
    type key = unit
    type 'a event_t = 'a GdkEvent.t
    type t = key event_t


    datatype event =
      KEYPRESS
    | KEYRELEASE


    structure C = GdkEvent.C
    structure PolyML = GdkEvent.PolyML


    local
      open PolyMLFFI
    in
      val getWindow_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_window")
          (PolyML.PTR --> GObjectObjectClass.PolyML.PTR);

      val getSendEvent_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_send_event")
          (PolyML.PTR --> FFI.PolyML.Bool.VAL);

      val getTime_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_time")
          (PolyML.PTR --> FFI.PolyML.UInt32.VAL);

      val getState_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_state")
          (PolyML.PTR --> GdkModifierType.PolyML.VAL);

      val getKeyval_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_keyval")
          (PolyML.PTR --> FFI.PolyML.UInt32.VAL);

      val getHardwareKeycode_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_hardware_keycode")
          (PolyML.PTR --> FFI.PolyML.UInt32.VAL);

      val getGroup_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_group")
          (PolyML.PTR --> FFI.PolyML.UInt8.VAL);

      val getIsModifier_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_event_key_get_is_modifier")
          (PolyML.PTR --> FFI.PolyML.Bool.VAL);
    end


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
