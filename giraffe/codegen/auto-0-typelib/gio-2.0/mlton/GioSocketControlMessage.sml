structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    val getType_ = _import "g_socket_control_message_get_type" : unit -> GObjectType.C.val_;
    val getLevel_ = _import "g_socket_control_message_get_level" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getMsgType_ = _import "g_socket_control_message_get_msg_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getSize_ = _import "g_socket_control_message_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.C.val_;
    type 'a class = 'a GioSocketControlMessageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLevel_ self
    fun getMsgType self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMsgType_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getSize_ self
  end
