structure GioDBusMessage :>
  GIO_D_BUS_MESSAGE
    where type 'a class_t = 'a GioDBusMessageClass.t
    where type d_bus_message_byte_order_t = GioDBusMessageByteOrder.t
    where type d_bus_message_flags_t = GioDBusMessageFlags.t
    where type d_bus_message_header_field_t = GioDBusMessageHeaderField.t
    where type d_bus_message_type_t = GioDBusMessageType.t
    where type 'a unix_f_d_list_class_t = 'a GioUnixFDListClass.t =
  struct
    val getType_ = _import "g_dbus_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_dbus_message_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newMethodCall_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_g_dbus_message_new_method_call" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val copy_ = fn x1 & x2 => (_import "g_dbus_message_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getArg0_ = _import "g_dbus_message_get_arg0" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getBody_ = _import "g_dbus_message_get_body" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getByteOrder_ = _import "g_dbus_message_get_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusMessageByteOrder.C.val_;
    val getDestination_ = _import "g_dbus_message_get_destination" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getErrorName_ = _import "g_dbus_message_get_error_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFlags_ = _import "g_dbus_message_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusMessageFlags.C.val_;
    val getHeader_ = fn x1 & x2 => (_import "g_dbus_message_get_header" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDBusMessageHeaderField.C.val_ -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;) (x1, x2)
    val getInterface_ = _import "g_dbus_message_get_interface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getLocked_ = _import "g_dbus_message_get_locked" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getMember_ = _import "g_dbus_message_get_member" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getMessageType_ = _import "g_dbus_message_get_message_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusMessageType.C.val_;
    val getNumUnixFds_ = _import "g_dbus_message_get_num_unix_fds" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getPath_ = _import "g_dbus_message_get_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getReplySerial_ = _import "g_dbus_message_get_reply_serial" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getSender_ = _import "g_dbus_message_get_sender" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getSerial_ = _import "g_dbus_message_get_serial" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getSignature_ = _import "g_dbus_message_get_signature" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUnixFdList_ = _import "g_dbus_message_get_unix_fd_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val lock_ = _import "g_dbus_message_lock" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val newMethodErrorLiteral_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_message_new_method_error_literal" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newMethodReply_ = _import "g_dbus_message_new_method_reply" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val print_ = fn x1 & x2 => (_import "g_dbus_message_print" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val setBody_ = fn x1 & x2 => (_import "g_dbus_message_set_body" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> unit;) (x1, x2)
    val setByteOrder_ = fn x1 & x2 => (_import "g_dbus_message_set_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDBusMessageByteOrder.C.val_ -> unit;) (x1, x2)
    val setDestination_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_destination" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_dbus_message_set_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDBusMessageFlags.C.val_ -> unit;) (x1, x2)
    val setHeader_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_message_set_header" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMessageType_ = fn x1 & x2 => (_import "g_dbus_message_set_message_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDBusMessageType.C.val_ -> unit;) (x1, x2)
    val setNumUnixFds_ = fn x1 & x2 => (_import "g_dbus_message_set_num_unix_fds" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReplySerial_ = fn x1 & x2 => (_import "g_dbus_message_set_reply_serial" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setSender_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_sender" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSerial_ = fn x1 & x2 => (_import "g_dbus_message_set_serial" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setSignature_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_message_set_signature" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUnixFdList_ = fn x1 & x2 => (_import "g_dbus_message_set_unix_fd_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val toGerror_ = fn x1 & x2 => (_import "g_dbus_message_to_gerror" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
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
    fun print self indent = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.String.C.fromPtr true) print_ (self & indent)
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
