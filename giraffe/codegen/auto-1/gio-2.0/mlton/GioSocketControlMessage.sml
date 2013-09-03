structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class_t = 'a GioSocketControlMessageClass.t =
  struct
    val getType_ = _import "g_socket_control_message_get_type" : unit -> GObjectType.C.val_;
    val getLevel_ = _import "g_socket_control_message_get_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getMsgType_ = _import "g_socket_control_message_get_msg_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getSize_ = _import "g_socket_control_message_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.val_;
    val serialize_ = _import "g_socket_control_message_serialize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioSocketControlMessageClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getLevel_ self
    fun getMsgType self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMsgType_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.fromVal) getSize_ self
    fun serialize self = (GObjectObjectClass.C.withPtr ---> I) serialize_ self
  end
