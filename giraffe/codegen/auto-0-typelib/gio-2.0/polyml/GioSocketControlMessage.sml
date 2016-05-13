structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_control_message_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getLevel_ = call (load_sym libgio "g_socket_control_message_get_level") (GioSocketControlMessageClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMsgType_ = call (load_sym libgio "g_socket_control_message_get_msg_type") (GioSocketControlMessageClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSize_ = call (load_sym libgio "g_socket_control_message_get_size") (GioSocketControlMessageClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
    end
    type 'a class = 'a GioSocketControlMessageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GioSocketControlMessageClass.C.withPtr ---> FFI.Int32.C.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.C.withPtr ---> FFI.Int32.C.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.C.withPtr ---> FFI.UInt64.C.fromVal) getSize_ self
  end
