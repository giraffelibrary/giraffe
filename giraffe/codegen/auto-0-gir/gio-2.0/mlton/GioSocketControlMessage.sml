structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    val getType_ = _import "g_socket_control_message_get_type" : unit -> GObjectType.C.val_;
    val getLevel_ = _import "g_socket_control_message_get_level" : GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p -> FFI.Int.C.val_;
    val getMsgType_ = _import "g_socket_control_message_get_msg_type" : GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p -> FFI.Int.C.val_;
    val getSize_ = _import "g_socket_control_message_get_size" : GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p -> FFI.Size.C.val_;
    type 'a class = 'a GioSocketControlMessageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GioSocketControlMessageClass.C.withPtr ---> FFI.Int.C.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.C.withPtr ---> FFI.Int.C.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.C.withPtr ---> FFI.Size.C.fromVal) getSize_ self
  end
