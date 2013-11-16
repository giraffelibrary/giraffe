structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class_t = 'a GioDBusMessageClass.t
    where type dbusmessagebyteorder_t = GioDBusMessageByteOrder.t
    where type dbusmessageflags_t = GioDBusMessageFlags.t
    where type dbusmessageheaderfield_t = GioDBusMessageHeaderField.t
    where type dbusmessagetype_t = GioDBusMessageType.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_message_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_dbus_message_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newMethodCall_ =
        call (load_sym libgio "g_dbus_message_new_method_call")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newSignal_ =
        call (load_sym libgio "g_dbus_message_new_signal")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val copy_ = call (load_sym libgio "g_dbus_message_copy") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val getArg0_ = call (load_sym libgio "g_dbus_message_get_arg0") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getBody_ = call (load_sym libgio "g_dbus_message_get_body") (GObjectObjectClass.PolyML.PTR --> GLibVariantRecord.PolyML.PTR)
      val getByteOrder_ = call (load_sym libgio "g_dbus_message_get_byte_order") (GObjectObjectClass.PolyML.PTR --> GioDBusMessageByteOrder.PolyML.VAL)
      val getDestination_ = call (load_sym libgio "g_dbus_message_get_destination") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getErrorName_ = call (load_sym libgio "g_dbus_message_get_error_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getFlags_ = call (load_sym libgio "g_dbus_message_get_flags") (GObjectObjectClass.PolyML.PTR --> GioDBusMessageFlags.PolyML.VAL)
      val getHeader_ = call (load_sym libgio "g_dbus_message_get_header") (GObjectObjectClass.PolyML.PTR &&> GioDBusMessageHeaderField.PolyML.VAL --> GLibVariantRecord.PolyML.PTR)
      val getInterface_ = call (load_sym libgio "g_dbus_message_get_interface") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLocked_ = call (load_sym libgio "g_dbus_message_get_locked") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getMember_ = call (load_sym libgio "g_dbus_message_get_member") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getMessageType_ = call (load_sym libgio "g_dbus_message_get_message_type") (GObjectObjectClass.PolyML.PTR --> GioDBusMessageType.PolyML.VAL)
      val getNumUnixFds_ = call (load_sym libgio "g_dbus_message_get_num_unix_fds") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getPath_ = call (load_sym libgio "g_dbus_message_get_path") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getReplySerial_ = call (load_sym libgio "g_dbus_message_get_reply_serial") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getSender_ = call (load_sym libgio "g_dbus_message_get_sender") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getSerial_ = call (load_sym libgio "g_dbus_message_get_serial") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getSignature_ = call (load_sym libgio "g_dbus_message_get_signature") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUnixFdList_ = call (load_sym libgio "g_dbus_message_get_unix_fd_list") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val lock_ = call (load_sym libgio "g_dbus_message_lock") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val newMethodErrorLiteral_ =
        call (load_sym libgio "g_dbus_message_new_method_error_literal")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newMethodReply_ = call (load_sym libgio "g_dbus_message_new_method_reply") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val print_ = call (load_sym libgio "g_dbus_message_print") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val setBody_ = call (load_sym libgio "g_dbus_message_set_body") (GObjectObjectClass.PolyML.PTR &&> GLibVariantRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setByteOrder_ = call (load_sym libgio "g_dbus_message_set_byte_order") (GObjectObjectClass.PolyML.PTR &&> GioDBusMessageByteOrder.PolyML.VAL --> FFI.PolyML.VOID)
      val setDestination_ = call (load_sym libgio "g_dbus_message_set_destination") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setErrorName_ = call (load_sym libgio "g_dbus_message_set_error_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setFlags_ = call (load_sym libgio "g_dbus_message_set_flags") (GObjectObjectClass.PolyML.PTR &&> GioDBusMessageFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val setHeader_ =
        call (load_sym libgio "g_dbus_message_set_header")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioDBusMessageHeaderField.PolyML.VAL
             &&> GLibVariantRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setInterface_ = call (load_sym libgio "g_dbus_message_set_interface") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setMember_ = call (load_sym libgio "g_dbus_message_set_member") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setMessageType_ = call (load_sym libgio "g_dbus_message_set_message_type") (GObjectObjectClass.PolyML.PTR &&> GioDBusMessageType.PolyML.VAL --> FFI.PolyML.VOID)
      val setNumUnixFds_ = call (load_sym libgio "g_dbus_message_set_num_unix_fds") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setPath_ = call (load_sym libgio "g_dbus_message_set_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setReplySerial_ = call (load_sym libgio "g_dbus_message_set_reply_serial") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setSender_ = call (load_sym libgio "g_dbus_message_set_sender") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setSerial_ = call (load_sym libgio "g_dbus_message_set_serial") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setSignature_ = call (load_sym libgio "g_dbus_message_set_signature") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setUnixFdList_ = call (load_sym libgio "g_dbus_message_set_unix_fd_list") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val toGerror_ = call (load_sym libgio "g_dbus_message_to_gerror") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioDBusMessageClass.t
    type dbusmessagebyteorder_t = GioDBusMessageByteOrder.t
    type dbusmessageflags_t = GioDBusMessageFlags.t
    type dbusmessageheaderfield_t = GioDBusMessageHeaderField.t
    type dbusmessagetype_t = GioDBusMessageType.t
    type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioDBusMessageClass.C.fromPtr true) new_ ()
    fun newMethodCall name path interface method =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> GioDBusMessageClass.C.fromPtr true
      )
        newSignal_
        (
          path
           & interface
           & signal
        )
    fun copy self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusMessageClass.C.fromPtr true) copy_ (self & [])
    fun getArg0 self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getArg0_ self
    fun getBody self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getBody_ self
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageByteOrder.C.fromVal) getByteOrder_ self
    fun getDestination self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDestination_ self
    fun getErrorName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getErrorName_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageFlags.C.fromVal) getFlags_ self
    fun getHeader self headerField = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageHeaderField.C.withVal ---> GLibVariantRecord.C.fromPtr true) getHeader_ (self & headerField)
    fun getInterface self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getInterface_ self
    fun getLocked self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLocked_ self
    fun getMember self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getMember_ self
    fun getMessageType self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageType.C.fromVal) getMessageType_ self
    fun getNumUnixFds self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getNumUnixFds_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getPath_ self
    fun getReplySerial self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getReplySerial_ self
    fun getSender self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getSender_ self
    fun getSerial self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getSerial_ self
    fun getSignature self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getSignature_ self
    fun getUnixFdList self = (GObjectObjectClass.C.withPtr ---> GioUnixFDListClass.C.fromPtr false) getUnixFdList_ self
    fun lock self = (GObjectObjectClass.C.withPtr ---> I) lock_ self
    fun newMethodErrorLiteral self errorName errorMessage =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> GioDBusMessageClass.C.fromPtr true
      )
        newMethodErrorLiteral_
        (
          self
           & errorName
           & errorMessage
        )
    fun newMethodReply self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr true) newMethodReply_ self
    fun print self indent = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.String.C.fromPtr true) print_ (self & indent)
    fun setBody self body = (GObjectObjectClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setBody_ (self & body)
    fun setByteOrder self byteOrder = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageByteOrder.C.withVal ---> I) setByteOrder_ (self & byteOrder)
    fun setDestination self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDestination_ (self & value)
    fun setErrorName self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setErrorName_ (self & value)
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
    fun setInterface self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setInterface_ (self & value)
    fun setMember self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setMember_ (self & value)
    fun setMessageType self type' = (GObjectObjectClass.C.withPtr &&&> GioDBusMessageType.C.withVal ---> I) setMessageType_ (self & type')
    fun setNumUnixFds self value = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setNumUnixFds_ (self & value)
    fun setPath self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setPath_ (self & value)
    fun setReplySerial self value = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setReplySerial_ (self & value)
    fun setSender self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setSender_ (self & value)
    fun setSerial self serial = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setSerial_ (self & serial)
    fun setSignature self value = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setSignature_ (self & value)
    fun setUnixFdList self fdList = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setUnixFdList_ (self & fdList)
    fun toGerror self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) toGerror_ (self & [])
    local
      open Property
    in
      val lockedProp = {get = fn x => get "locked" boolean x}
    end
  end
