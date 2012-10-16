structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class_t = 'a GioSocketControlMessageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_control_message_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getLevel_ = call (load_sym libgio "g_socket_control_message_get_level") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getMsgType_ = call (load_sym libgio "g_socket_control_message_get_msg_type") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getSize_ = call (load_sym libgio "g_socket_control_message_get_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Word64.VAL)
      val serialize_ = call (load_sym libgio "g_socket_control_message_serialize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSocketControlMessageClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLevel self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getLevel_ self
    fun getMsgType self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMsgType_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Word64.fromVal) getSize_ self
    fun serialize self = (GObjectObjectClass.C.withPtr ---> I) serialize_ self
  end
