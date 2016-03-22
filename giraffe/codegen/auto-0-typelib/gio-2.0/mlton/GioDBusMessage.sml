structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class = 'a GioDBusMessageClass.class
    where type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    where type d_bus_message_flags_t = GioDBusMessageFlags.t
    where type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    where type d_bus_message_type_t = GioDBusMessageType.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_dbus_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_dbus_message_new" : unit -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
    val newMethodCall_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_g_dbus_message_new_method_call" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val copy_ = fn x1 & x2 => (_import "g_dbus_message_copy" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;) (x1, x2)
    val getArg0_ = _import "g_dbus_message_get_arg0" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getBody_ = _import "g_dbus_message_get_body" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getByteOrder_ = _import "g_dbus_message_get_byte_order" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GioDBusMessageByteOrder.C.val_;
    val getDestination_ = _import "g_dbus_message_get_destination" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getErrorName_ = _import "g_dbus_message_get_error_name" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFlags_ = _import "g_dbus_message_get_flags" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GioDBusMessageFlags.C.val_;
    val getHeader_ = fn x1 & x2 => (_import "g_dbus_message_get_header" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * GioDBusMessageHeaderField.C.val_ -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;) (x1, x2)
    val getInterface_ = _import "g_dbus_message_get_interface" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLocked_ = _import "g_dbus_message_get_locked" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> FFI.Bool.C.val_;
    val getMember_ = _import "g_dbus_message_get_member" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMessageType_ = _import "g_dbus_message_get_message_type" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GioDBusMessageType.C.val_;
    val getNumUnixFds_ = _import "g_dbus_message_get_num_unix_fds" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> FFI.UInt32.C.val_;
    val getPath_ = _import "g_dbus_message_get_path" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getReplySerial_ = _import "g_dbus_message_get_reply_serial" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> FFI.UInt32.C.val_;
    val getSender_ = _import "g_dbus_message_get_sender" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSerial_ = _import "g_dbus_message_get_serial" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> FFI.UInt32.C.val_;
    val getSignature_ = _import "g_dbus_message_get_signature" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUnixFdList_ = _import "g_dbus_message_get_unix_fd_list" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p;
    val lock_ = _import "g_dbus_message_lock" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> unit;
    val newMethodErrorLiteral_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_message_new_method_error_literal" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newMethodReply_ = _import "g_dbus_message_new_method_reply" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
    val print_ = fn x1 & x2 => (_import "g_dbus_message_print" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * FFI.UInt32.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val setBody_ = fn x1 & x2 => (_import "g_dbus_message_set_body" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> unit;) (x1, x2)
    val setByteOrder_ = fn x1 & x2 => (_import "g_dbus_message_set_byte_order" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * GioDBusMessageByteOrder.C.val_ -> unit;) (x1, x2)
    val setDestination_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_destination" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_message_set_flags" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * GioDBusMessageFlags.C.val_ -> unit;) (x1, x2)
    val setHeader_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_message_set_header" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * GioDBusMessageHeaderField.C.val_
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
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
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMessageType_ = fn x1 & x2 => (_import "g_dbus_message_set_message_type" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * GioDBusMessageType.C.val_ -> unit;) (x1, x2)
    val setNumUnixFds_ = fn x1 & x2 => (_import "g_dbus_message_set_num_unix_fds" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_path" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReplySerial_ = fn x1 & x2 => (_import "g_dbus_message_set_reply_serial" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setSender_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_sender" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSerial_ = fn x1 & x2 => (_import "g_dbus_message_set_serial" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setSignature_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_signature" :
              GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUnixFdList_ = fn x1 & x2 => (_import "g_dbus_message_set_unix_fd_list" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * unit GioUnixFDListClass.C.p -> unit;) (x1, x2)
    val toGerror_ = fn x1 & x2 => (_import "g_dbus_message_to_gerror" : GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
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
