structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class_t = 'a GioDBusMessageClass.t
    where type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    where type d_bus_message_flags_t = GioDBusMessageFlags.t
    where type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    where type d_bus_message_type_t = GioDBusMessageType.t
    where type 'a unix_f_d_list_class_t = 'a GioUnixFDListClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_message_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_message_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newMethodCall_ =
        call (load_sym libgio "g_dbus_message_new_method_call")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newSignal_ =
        call (load_sym libgio "g_dbus_message_new_signal")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgio "g_dbus_message_copy") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val getArg0_ = call (load_sym libgio "g_dbus_message_get_arg0") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getBody_ = call (load_sym libgio "g_dbus_message_get_body") (GObjectObjectClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getByteOrder_ = call (load_sym libgio "g_dbus_message_get_byte_order") (GObjectObjectClass.PolyML.cPtr --> GioDBusMessageByteOrder.PolyML.cVal)
      val getDestination_ = call (load_sym libgio "g_dbus_message_get_destination") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getErrorName_ = call (load_sym libgio "g_dbus_message_get_error_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_dbus_message_get_flags") (GObjectObjectClass.PolyML.cPtr --> GioDBusMessageFlags.PolyML.cVal)
      val getHeader_ = call (load_sym libgio "g_dbus_message_get_header") (GObjectObjectClass.PolyML.cPtr &&> GioDBusMessageHeaderField.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val getInterface_ = call (load_sym libgio "g_dbus_message_get_interface") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLocked_ = call (load_sym libgio "g_dbus_message_get_locked") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMember_ = call (load_sym libgio "g_dbus_message_get_member") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessageType_ = call (load_sym libgio "g_dbus_message_get_message_type") (GObjectObjectClass.PolyML.cPtr --> GioDBusMessageType.PolyML.cVal)
      val getNumUnixFds_ = call (load_sym libgio "g_dbus_message_get_num_unix_fds") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getPath_ = call (load_sym libgio "g_dbus_message_get_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getReplySerial_ = call (load_sym libgio "g_dbus_message_get_reply_serial") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getSender_ = call (load_sym libgio "g_dbus_message_get_sender") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSerial_ = call (load_sym libgio "g_dbus_message_get_serial") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getSignature_ = call (load_sym libgio "g_dbus_message_get_signature") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnixFdList_ = call (load_sym libgio "g_dbus_message_get_unix_fd_list") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val lock_ = call (load_sym libgio "g_dbus_message_lock") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val newMethodErrorLiteral_ =
        call (load_sym libgio "g_dbus_message_new_method_error_literal")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newMethodReply_ = call (load_sym libgio "g_dbus_message_new_method_reply") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val print_ = call (load_sym libgio "g_dbus_message_print") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val setBody_ = call (load_sym libgio "g_dbus_message_set_body") (GObjectObjectClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setByteOrder_ = call (load_sym libgio "g_dbus_message_set_byte_order") (GObjectObjectClass.PolyML.cPtr &&> GioDBusMessageByteOrder.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDestination_ = call (load_sym libgio "g_dbus_message_set_destination") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setErrorName_ = call (load_sym libgio "g_dbus_message_set_error_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFlags_ = call (load_sym libgio "g_dbus_message_set_flags") (GObjectObjectClass.PolyML.cPtr &&> GioDBusMessageFlags.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHeader_ =
        call (load_sym libgio "g_dbus_message_set_header")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioDBusMessageHeaderField.PolyML.cVal
             &&> GLibVariantRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setInterface_ = call (load_sym libgio "g_dbus_message_set_interface") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMember_ = call (load_sym libgio "g_dbus_message_set_member") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMessageType_ = call (load_sym libgio "g_dbus_message_set_message_type") (GObjectObjectClass.PolyML.cPtr &&> GioDBusMessageType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNumUnixFds_ = call (load_sym libgio "g_dbus_message_set_num_unix_fds") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPath_ = call (load_sym libgio "g_dbus_message_set_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setReplySerial_ = call (load_sym libgio "g_dbus_message_set_reply_serial") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSender_ = call (load_sym libgio "g_dbus_message_set_sender") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setSerial_ = call (load_sym libgio "g_dbus_message_set_serial") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSignature_ = call (load_sym libgio "g_dbus_message_set_signature") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setUnixFdList_ = call (load_sym libgio "g_dbus_message_set_unix_fd_list") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val toGerror_ = call (load_sym libgio "g_dbus_message_to_gerror") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioDBusMessageClass.t
    type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    type d_bus_message_flags_t = GioDBusMessageFlags.t
    type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    type d_bus_message_type_t = GioDBusMessageType.t
    type 'a unix_f_d_list_class_t = 'a GioUnixFDListClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioDBusMessageClass.C.fromPtr true) new_ ()
    fun newMethodCall name path interface method =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioDBusMessageClass.C.fromPtr true
      )
        newMethodCall_
        (
          name
           & path
           & interface
           & method
        )
    fun newSignal path interface signal =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioDBusMessageClass.C.fromPtr true
      )
        newSignal_
        (
          path
           & interface
           & signal
        )
    fun copy self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusMessageClass.C.fromPtr true) copy_ (self & [])
    fun getArg0 self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getArg0_ self
    fun getBody self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getBody_ self
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageByteOrder.C.fromVal) getByteOrder_ self
    fun getDestination self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDestination_ self
    fun getErrorName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getErrorName_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageFlags.C.fromVal) getFlags_ self
    fun getHeader self headerField = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageHeaderField.C.withVal ---> GLibVariantRecord.C.fromPtr true) getHeader_ (self & headerField)
    fun getInterface self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getInterface_ self
    fun getLocked self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocked_ self
    fun getMember self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getMember_ self
    fun getMessageType self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageType.C.fromVal) getMessageType_ self
    fun getNumUnixFds self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getNumUnixFds_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPath_ self
    fun getReplySerial self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getReplySerial_ self
    fun getSender self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getSender_ self
    fun getSerial self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getSerial_ self
    fun getSignature self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getSignature_ self
    fun getUnixFdList self = (GObjectObjectClass.C.withPtr ---> GioUnixFDListClass.C.fromPtr false) getUnixFdList_ self
    fun lock self = (GObjectObjectClass.C.withPtr ---> I) lock_ self
    fun newMethodErrorLiteral self errorName errorMessage =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioDBusMessageClass.C.fromPtr true
      )
        newMethodErrorLiteral_
        (
          self
           & errorName
           & errorMessage
        )
    fun newMethodReply self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr true) newMethodReply_ self
    fun print self indent = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> Utf8.C.fromPtr true) print_ (self & indent)
    fun setBody self body = (GObjectObjectClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setBody_ (self & body)
    fun setByteOrder self byteOrder = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageByteOrder.C.withVal ---> I) setByteOrder_ (self & byteOrder)
    fun setDestination self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDestination_ (self & value)
    fun setErrorName self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setErrorName_ (self & value)
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setHeader self headerField value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioDBusMessageHeaderField.C.withVal
         &&&> GLibVariantRecord.C.withPtr
         ---> I
      )
        setHeader_
        (
          self
           & headerField
           & value
        )
    fun setInterface self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setInterface_ (self & value)
    fun setMember self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMember_ (self & value)
    fun setMessageType self type' = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageType.C.withVal ---> I) setMessageType_ (self & type')
    fun setNumUnixFds self value = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setNumUnixFds_ (self & value)
    fun setPath self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPath_ (self & value)
    fun setReplySerial self value = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setReplySerial_ (self & value)
    fun setSender self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSender_ (self & value)
    fun setSerial self serial = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setSerial_ (self & serial)
    fun setSignature self value = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSignature_ (self & value)
    fun setUnixFdList self fdList = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setUnixFdList_ (self & fdList)
    fun toGerror self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) toGerror_ (self & [])
    local
      open Property
    in
      val lockedProp = {get = fn x => get "locked" boolean x}
    end
  end
