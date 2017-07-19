structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class = 'a GioDBusMessageClass.class
    where type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    where type d_bus_message_flags_t = GioDBusMessageFlags.t
    where type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    where type d_bus_message_type_t = GioDBusMessageType.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_dbus_message_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_dbus_message_new" : unit -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
    val newMethodCall_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_g_dbus_message_new_method_call" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val newSignal_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_dbus_message_new_signal" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val copy_ = fn x1 & x2 => (_import "g_dbus_message_copy" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;) (x1, x2)
    val getArg0_ = _import "g_dbus_message_get_arg0" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getBody_ = _import "g_dbus_message_get_body" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getByteOrder_ = _import "g_dbus_message_get_byte_order" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GioDBusMessageByteOrder.FFI.val_;
    val getDestination_ = _import "g_dbus_message_get_destination" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getErrorName_ = _import "g_dbus_message_get_error_name" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFlags_ = _import "g_dbus_message_get_flags" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GioDBusMessageFlags.FFI.val_;
    val getHeader_ = fn x1 & x2 => (_import "g_dbus_message_get_header" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GioDBusMessageHeaderField.FFI.val_ -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;) (x1, x2)
    val getInterface_ = _import "g_dbus_message_get_interface" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLocked_ = _import "g_dbus_message_get_locked" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GBool.FFI.val_;
    val getMember_ = _import "g_dbus_message_get_member" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMessageType_ = _import "g_dbus_message_get_message_type" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GioDBusMessageType.FFI.val_;
    val getNumUnixFds_ = _import "g_dbus_message_get_num_unix_fds" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GUInt32.FFI.val_;
    val getPath_ = _import "g_dbus_message_get_path" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getReplySerial_ = _import "g_dbus_message_get_reply_serial" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GUInt32.FFI.val_;
    val getSender_ = _import "g_dbus_message_get_sender" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getSerial_ = _import "g_dbus_message_get_serial" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GUInt32.FFI.val_;
    val getSignature_ = _import "g_dbus_message_get_signature" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUnixFdList_ = _import "g_dbus_message_get_unix_fd_list" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
    val lock_ = _import "g_dbus_message_lock" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> unit;
    val newMethodErrorLiteral_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_message_new_method_error_literal" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newMethodReply_ = _import "g_dbus_message_new_method_reply" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
    val print_ = fn x1 & x2 => (_import "g_dbus_message_print" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GUInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val setBody_ = fn x1 & x2 => (_import "g_dbus_message_set_body" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val setByteOrder_ = fn x1 & x2 => (_import "g_dbus_message_set_byte_order" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GioDBusMessageByteOrder.FFI.val_ -> unit;) (x1, x2)
    val setDestination_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_destination" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setErrorName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_error_name" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_message_set_flags" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GioDBusMessageFlags.FFI.val_ -> unit;) (x1, x2)
    val setHeader_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_message_set_header" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * GioDBusMessageHeaderField.FFI.val_
               * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInterface_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_interface" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMember_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_member" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMessageType_ = fn x1 & x2 => (_import "g_dbus_message_set_message_type" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GioDBusMessageType.FFI.val_ -> unit;) (x1, x2)
    val setNumUnixFds_ = fn x1 & x2 => (_import "g_dbus_message_set_num_unix_fds" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_path" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReplySerial_ = fn x1 & x2 => (_import "g_dbus_message_set_reply_serial" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setSender_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_sender" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSerial_ = fn x1 & x2 => (_import "g_dbus_message_set_serial" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setSignature_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_signature" :
              GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUnixFdList_ = fn x1 & x2 => (_import "g_dbus_message_set_unix_fd_list" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * unit GioUnixFDListClass.FFI.p -> unit;) (x1, x2)
    val toGerror_ = fn x1 & x2 => (_import "g_dbus_message_to_gerror" : GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
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
    fun print self indent = (GioDBusMessageClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> Utf8.FFI.fromPtr 1) print_ (self & indent)
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
