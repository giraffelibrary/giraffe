structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_control_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val deserialize_ =
        call (getSymbol "g_socket_control_message_deserialize")
          (
            GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GSize.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             --> GioSocketControlMessageClass.PolyML.cPtr
          )
      val getLevel_ = call (getSymbol "g_socket_control_message_get_level") (GioSocketControlMessageClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMsgType_ = call (getSymbol "g_socket_control_message_get_msg_type") (GioSocketControlMessageClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSize_ = call (getSymbol "g_socket_control_message_get_size") (GioSocketControlMessageClass.PolyML.cPtr --> GSize.PolyML.cVal)
    end
    type 'a class = 'a GioSocketControlMessageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deserialize
      (
        level,
        type',
        data
      ) =
      let
        val size = LargeInt.fromInt (GUInt8CArrayN.length data)
        val retVal =
          (
            GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GSize.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             ---> GioSocketControlMessageClass.FFI.fromPtr true
          )
            deserialize_
            (
              level
               & type'
               & size
               & data
            )
      in
        retVal
      end
    fun getLevel self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt.FFI.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt.FFI.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.FFI.withPtr ---> GSize.FFI.fromVal) getSize_ self
  end
