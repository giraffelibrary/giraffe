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
      val getType_ = call (getSymbol "g_dbus_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_dbus_message_new") (cVoid --> GioDBusMessageClass.PolyML.cPtr)
      val newMethodCall_ =
        call (getSymbol "g_dbus_message_new_method_call")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val newSignal_ =
        call (getSymbol "g_dbus_message_new_signal")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val copy_ = call (getSymbol "g_dbus_message_copy") (GioDBusMessageClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusMessageClass.PolyML.cPtr)
      val getArg0_ = call (getSymbol "g_dbus_message_get_arg0") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getBody_ = call (getSymbol "g_dbus_message_get_body") (GioDBusMessageClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getByteOrder_ = call (getSymbol "g_dbus_message_get_byte_order") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageByteOrder.PolyML.cVal)
      val getDestination_ = call (getSymbol "g_dbus_message_get_destination") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getErrorName_ = call (getSymbol "g_dbus_message_get_error_name") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_dbus_message_get_flags") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageFlags.PolyML.cVal)
      val getHeader_ = call (getSymbol "g_dbus_message_get_header") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageHeaderField.PolyML.cVal --> GLibVariantRecord.PolyML.cPtr)
      val getInterface_ = call (getSymbol "g_dbus_message_get_interface") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLocked_ = call (getSymbol "g_dbus_message_get_locked") (GioDBusMessageClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMember_ = call (getSymbol "g_dbus_message_get_member") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessageType_ = call (getSymbol "g_dbus_message_get_message_type") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageType.PolyML.cVal)
      val getNumUnixFds_ = call (getSymbol "g_dbus_message_get_num_unix_fds") (GioDBusMessageClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getPath_ = call (getSymbol "g_dbus_message_get_path") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getReplySerial_ = call (getSymbol "g_dbus_message_get_reply_serial") (GioDBusMessageClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getSender_ = call (getSymbol "g_dbus_message_get_sender") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSerial_ = call (getSymbol "g_dbus_message_get_serial") (GioDBusMessageClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getSignature_ = call (getSymbol "g_dbus_message_get_signature") (GioDBusMessageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnixFdList_ = call (getSymbol "g_dbus_message_get_unix_fd_list") (GioDBusMessageClass.PolyML.cPtr --> GioUnixFDListClass.PolyML.cPtr)
      val lock_ = call (getSymbol "g_dbus_message_lock") (GioDBusMessageClass.PolyML.cPtr --> cVoid)
      val newMethodErrorLiteral_ =
        call (getSymbol "g_dbus_message_new_method_error_literal")
          (
            GioDBusMessageClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val newMethodReply_ = call (getSymbol "g_dbus_message_new_method_reply") (GioDBusMessageClass.PolyML.cPtr --> GioDBusMessageClass.PolyML.cPtr)
      val print_ = call (getSymbol "g_dbus_message_print") (GioDBusMessageClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val setBody_ = call (getSymbol "g_dbus_message_set_body") (GioDBusMessageClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> cVoid)
      val setByteOrder_ = call (getSymbol "g_dbus_message_set_byte_order") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageByteOrder.PolyML.cVal --> cVoid)
      val setDestination_ = call (getSymbol "g_dbus_message_set_destination") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setErrorName_ = call (getSymbol "g_dbus_message_set_error_name") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_dbus_message_set_flags") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageFlags.PolyML.cVal --> cVoid)
      val setHeader_ =
        call (getSymbol "g_dbus_message_set_header")
          (
            GioDBusMessageClass.PolyML.cPtr
             &&> GioDBusMessageHeaderField.PolyML.cVal
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val setInterface_ = call (getSymbol "g_dbus_message_set_interface") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMember_ = call (getSymbol "g_dbus_message_set_member") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMessageType_ = call (getSymbol "g_dbus_message_set_message_type") (GioDBusMessageClass.PolyML.cPtr &&> GioDBusMessageType.PolyML.cVal --> cVoid)
      val setNumUnixFds_ = call (getSymbol "g_dbus_message_set_num_unix_fds") (GioDBusMessageClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setPath_ = call (getSymbol "g_dbus_message_set_path") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setReplySerial_ = call (getSymbol "g_dbus_message_set_reply_serial") (GioDBusMessageClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setSender_ = call (getSymbol "g_dbus_message_set_sender") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setSerial_ = call (getSymbol "g_dbus_message_set_serial") (GioDBusMessageClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setSignature_ = call (getSymbol "g_dbus_message_set_signature") (GioDBusMessageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setUnixFdList_ = call (getSymbol "g_dbus_message_set_unix_fd_list") (GioDBusMessageClass.PolyML.cPtr &&> GioUnixFDListClass.PolyML.cOptPtr --> cVoid)
      val toGerror_ = call (getSymbol "g_dbus_message_to_gerror") (GioDBusMessageClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusMessageClass.class
    type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    type d_bus_message_flags_t = GioDBusMessageFlags.t
    type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    type d_bus_message_type_t = GioDBusMessageType.t
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioDBusMessageClass.FFI.fromPtr true) new_ ()
    fun newMethodCall
      (
        name,
        path,
        interface,
        method
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        newMethodCall_
        (
          name
           & path
           & interface
           & method
        )
    fun newSignal
      (
        path,
        interface,
        signal
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        newSignal_
        (
          path
           & interface
           & signal
        )
    fun copy self = (GioDBusMessageClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusMessageClass.FFI.fromPtr true) copy_ (self & [])
    fun getArg0 self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getArg0_ self
    fun getBody self = (GioDBusMessageClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getBody_ self
    fun getByteOrder self = (GioDBusMessageClass.FFI.withPtr ---> GioDBusMessageByteOrder.FFI.fromVal) getByteOrder_ self
    fun getDestination self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDestination_ self
    fun getErrorName self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getErrorName_ self
    fun getFlags self = (GioDBusMessageClass.FFI.withPtr ---> GioDBusMessageFlags.FFI.fromVal) getFlags_ self
    fun getHeader self headerField = (GioDBusMessageClass.FFI.withPtr &&&> GioDBusMessageHeaderField.FFI.withVal ---> GLibVariantRecord.FFI.fromPtr true) getHeader_ (self & headerField)
    fun getInterface self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getInterface_ self
    fun getLocked self = (GioDBusMessageClass.FFI.withPtr ---> GBool.FFI.fromVal) getLocked_ self
    fun getMember self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMember_ self
    fun getMessageType self = (GioDBusMessageClass.FFI.withPtr ---> GioDBusMessageType.FFI.fromVal) getMessageType_ self
    fun getNumUnixFds self = (GioDBusMessageClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getNumUnixFds_ self
    fun getPath self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPath_ self
    fun getReplySerial self = (GioDBusMessageClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getReplySerial_ self
    fun getSender self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSender_ self
    fun getSerial self = (GioDBusMessageClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getSerial_ self
    fun getSignature self = (GioDBusMessageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSignature_ self
    fun getUnixFdList self = (GioDBusMessageClass.FFI.withPtr ---> GioUnixFDListClass.FFI.fromPtr false) getUnixFdList_ self
    fun lock self = (GioDBusMessageClass.FFI.withPtr ---> I) lock_ self
    fun newMethodErrorLiteral self (errorName, errorMessage) =
      (
        GioDBusMessageClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        newMethodErrorLiteral_
        (
          self
           & errorName
           & errorMessage
        )
    fun newMethodReply self = (GioDBusMessageClass.FFI.withPtr ---> GioDBusMessageClass.FFI.fromPtr true) newMethodReply_ self
    fun print self indent = (GioDBusMessageClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) print_ (self & indent)
    fun setBody self body = (GioDBusMessageClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> I) setBody_ (self & body)
    fun setByteOrder self byteOrder = (GioDBusMessageClass.FFI.withPtr &&&> GioDBusMessageByteOrder.FFI.withVal ---> I) setByteOrder_ (self & byteOrder)
    fun setDestination self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDestination_ (self & value)
    fun setErrorName self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setErrorName_ (self & value)
    fun setFlags self flags = (GioDBusMessageClass.FFI.withPtr &&&> GioDBusMessageFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setHeader self (headerField, value) =
      (
        GioDBusMessageClass.FFI.withPtr
         &&&> GioDBusMessageHeaderField.FFI.withVal
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        setHeader_
        (
          self
           & headerField
           & value
        )
    fun setInterface self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setInterface_ (self & value)
    fun setMember self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMember_ (self & value)
    fun setMessageType self type' = (GioDBusMessageClass.FFI.withPtr &&&> GioDBusMessageType.FFI.withVal ---> I) setMessageType_ (self & type')
    fun setNumUnixFds self value = (GioDBusMessageClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setNumUnixFds_ (self & value)
    fun setPath self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPath_ (self & value)
    fun setReplySerial self value = (GioDBusMessageClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setReplySerial_ (self & value)
    fun setSender self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setSender_ (self & value)
    fun setSerial self serial = (GioDBusMessageClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setSerial_ (self & serial)
    fun setSignature self value = (GioDBusMessageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setSignature_ (self & value)
    fun setUnixFdList self fdList = (GioDBusMessageClass.FFI.withPtr &&&> GioUnixFDListClass.FFI.withOptPtr ---> I) setUnixFdList_ (self & fdList)
    fun toGerror self = (GioDBusMessageClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) toGerror_ (self & [])
    local
      open Property
    in
      val lockedProp = {get = fn x => get "locked" boolean x}
    end
  end
