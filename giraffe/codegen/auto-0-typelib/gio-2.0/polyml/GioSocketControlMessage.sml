structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class_t = 'a GioSocketControlMessageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_control_message_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getLevel_ = call (load_sym libgio "g_socket_control_message_get_level") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMsgType_ = call (load_sym libgio "g_socket_control_message_get_msg_type") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSize_ = call (load_sym libgio "g_socket_control_message_get_size") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
    end
    type 'a class_t = 'a GioSocketControlMessageClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLevel_ self
    fun getMsgType self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMsgType_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getSize_ self
  end
