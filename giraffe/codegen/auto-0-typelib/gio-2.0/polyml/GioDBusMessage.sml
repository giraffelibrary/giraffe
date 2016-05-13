structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class = 'a GioDBusMessageClass.class
    where type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    where type d_bus_message_flags_t = GioDBusMessageFlags.t
    where type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    where type d_bus_message_type_t = GioDBusMessageType.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_message_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_message_new") (PolyMLFFI.cVoid --> GioDBusMessageClass.PolyML.cPtr)
      val newMethodCall_ =
        call (load_sym libgio "g_dbus_message_new_method_call")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val newSignal_ =
        call (load_sym libgio "g_dbus_message_new_signal")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgio "g_dbus_message_copy") (GioDBusMessageClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusMessageClass.PolyML.cPtr)
      val getArg0_ = call (load_sym libgio "g_dbus_message_get_arg0") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getBody_ = call (load_sym libgio "g_dbus_message_get_body") (GioDBusMessageClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getByteOrder_ = call (load_sym libgio "g_dbus_message_get_byte_order") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageByteOrder.PolyML.cVal)
      val getDestination_ = call (load_sym libgio "g_dbus_message_get_destination") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getErrorName_ = call (load_sym libgio "g_dbus_message_get_error_name") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_dbus_message_get_flags") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageFlags.PolyML.cVal)
      val getHeader_ = call (load_sym libgio "g_dbus_message_get_header") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageHeaderField.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val getInterface_ = call (load_sym libgio "g_dbus_message_get_interface") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLocked_ = call (load_sym libgio "g_dbus_message_get_locked") (GioDBusMessageClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMember_ = call (load_sym libgio "g_dbus_message_get_member") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessageType_ = call (load_sym libgio "g_dbus_message_get_message_type") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageType.PolyML.cVal)
      val getNumUnixFds_ = call (load_sym libgio "g_dbus_message_get_num_unix_fds") (GioDBusMessageClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getPath_ = call (load_sym libgio "g_dbus_message_get_path") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getReplySerial_ = call (load_sym libgio "g_dbus_message_get_reply_serial") (GioDBusMessageClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getSender_ = call (load_sym libgio "g_dbus_message_get_sender") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSerial_ = call (load_sym libgio "g_dbus_message_get_serial") (GioDBusMessageClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getSignature_ = call (load_sym libgio "g_dbus_message_get_signature") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnixFdList_ = call (load_sym libgio "g_dbus_message_get_unix_fd_list") (GioDBusMessageClass.PolyML.cPtr --> GioUnixFDListClass.PolyML.cPtr)
      val lock_ = call (load_sym libgio "g_dbus_message_lock") (GioDBusMessageClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val newMethodErrorLiteral_ =
        call (load_sym libgio "g_dbus_message_new_method_error_literal")
          (
            GioDBusMessageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val newMethodReply_ = call (load_sym libgio "g_dbus_message_new_method_reply") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageClass.PolyML.cPtr)
      val print_ = call (load_sym libgio "g_dbus_message_print") (GioDBusMessageClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val setBody_ = call (load_sym libgio "g_dbus_message_set_body") (GioDBusMessageClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setByteOrder_ = call (load_sym libgio "g_dbus_message_set_byte_order") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageByteOrder.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDestination_ = call (load_sym libgio "g_dbus_message_set_destination") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setErrorName_ = call (load_sym libgio "g_dbus_message_set_error_name") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFlags_ = call (load_sym libgio "g_dbus_message_set_flags") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageFlags.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHeader_ =
        call (load_sym libgio "g_dbus_message_set_header")
          (
            GioDBusMessageClass.PolyML.cPtr
             &&> GioDBusMessageHeaderField.PolyML.cVal
             &&> GLibVariantRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val setInterface_ = call (load_sym libgio "g_dbus_message_set_interface") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setMember_ = call (load_sym libgio "g_dbus_message_set_member") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setMessageType_ = call (load_sym libgio "g_dbus_message_set_message_type") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setNumUnixFds_ = call (load_sym libgio "g_dbus_message_set_num_unix_fds") (GioDBusMessageClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPath_ = call (load_sym libgio "g_dbus_message_set_path") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setReplySerial_ = call (load_sym libgio "g_dbus_message_set_reply_serial") (GioDBusMessageClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSender_ = call (load_sym libgio "g_dbus_message_set_sender") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setSerial_ = call (load_sym libgio "g_dbus_message_set_serial") (GioDBusMessageClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSignature_ = call (load_sym libgio "g_dbus_message_set_signature") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setUnixFdList_ = call (load_sym libgio "g_dbus_message_set_unix_fd_list") (GioDBusMessageClass.PolyML.cPtr &&> GioUnixFDListClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val toGerror_ = call (load_sym libgio "g_dbus_message_to_gerror") (GioDBusMessageClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusMessageClass.class
    type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    type d_bus_message_flags_t = GioDBusMessageFlags.t
    type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    type d_bus_message_type_t = GioDBusMessageType.t
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
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
    fun copy self = (GioDBusMessageClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusMessageClass.C.fromPtr true) copy_ (self & [])
    fun getArg0 self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getArg0_ self
    fun getBody self = (GioDBusMessageClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getBody_ self
    fun getByteOrder self = (GioDBusMessageClass.C.withPtr ---> GioDBusMessageByteOrder.C.fromVal) getByteOrder_ self
    fun getDestination self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getDestination_ self
    fun getErrorName self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getErrorName_ self
    fun getFlags self = (GioDBusMessageClass.C.withPtr ---> GioDBusMessageFlags.C.fromVal) getFlags_ self
    fun getHeader self headerField = (GioDBusMessageClass.C.withPtr &&&> GioDBusMessageHeaderField.C.withVal ---> GLibVariantRecord.C.fromPtr true) getHeader_ (self & headerField)
    fun getInterface self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getInterface_ self
    fun getLocked self = (GioDBusMessageClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocked_ self
    fun getMember self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getMember_ self
    fun getMessageType self = (GioDBusMessageClass.C.withPtr ---> GioDBusMessageType.C.fromVal) getMessageType_ self
    fun getNumUnixFds self = (GioDBusMessageClass.C.withPtr ---> FFI.UInt32.C.fromVal) getNumUnixFds_ self
    fun getPath self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getPath_ self
    fun getReplySerial self = (GioDBusMessageClass.C.withPtr ---> FFI.UInt32.C.fromVal) getReplySerial_ self
    fun getSender self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getSender_ self
    fun getSerial self = (GioDBusMessageClass.C.withPtr ---> FFI.UInt32.C.fromVal) getSerial_ self
    fun getSignature self = (GioDBusMessageClass.C.withPtr ---> Utf8.C.fromPtr false) getSignature_ self
    fun getUnixFdList self = (GioDBusMessageClass.C.withPtr ---> GioUnixFDListClass.C.fromPtr false) getUnixFdList_ self
    fun lock self = (GioDBusMessageClass.C.withPtr ---> I) lock_ self
    fun newMethodErrorLiteral self errorName errorMessage =
      (
        GioDBusMessageClass.C.withPtr
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
    fun newMethodReply self = (GioDBusMessageClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr true) newMethodReply_ self
    fun print self indent = (GioDBusMessageClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> Utf8.C.fromPtr true) print_ (self & indent)
    fun setBody self body = (GioDBusMessageClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setBody_ (self & body)
    fun setByteOrder self byteOrder = (GioDBusMessageClass.C.withPtr &&&> GioDBusMessageByteOrder.C.withVal ---> I) setByteOrder_ (self & byteOrder)
    fun setDestination self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDestination_ (self & value)
    fun setErrorName self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setErrorName_ (self & value)
    fun setFlags self flags = (GioDBusMessageClass.C.withPtr &&&> GioDBusMessageFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setHeader self headerField value =
      (
        GioDBusMessageClass.C.withPtr
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
    fun setInterface self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setInterface_ (self & value)
    fun setMember self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMember_ (self & value)
    fun setMessageType self type' = (GioDBusMessageClass.C.withPtr &&&> GioDBusMessageType.C.withVal ---> I) setMessageType_ (self & type')
    fun setNumUnixFds self value = (GioDBusMessageClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setNumUnixFds_ (self & value)
    fun setPath self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPath_ (self & value)
    fun setReplySerial self value = (GioDBusMessageClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setReplySerial_ (self & value)
    fun setSender self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSender_ (self & value)
    fun setSerial self serial = (GioDBusMessageClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setSerial_ (self & serial)
    fun setSignature self value = (GioDBusMessageClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setSignature_ (self & value)
    fun setUnixFdList self fdList = (GioDBusMessageClass.C.withPtr &&&> GioUnixFDListClass.C.withOptPtr ---> I) setUnixFdList_ (self & fdList)
    fun toGerror self = (GioDBusMessageClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) toGerror_ (self & [])
    local
      open Property
    in
      val lockedProp = {get = fn x => get "locked" boolean x}
    end
  end
