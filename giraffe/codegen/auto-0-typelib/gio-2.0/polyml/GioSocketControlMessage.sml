structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_control_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val deserialize_ =
        call (getSymbol "g_socket_control_message_deserialize")
          (
            GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt64.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             --> GioSocketControlMessageClass.PolyML.cPtr
          )
      val getLevel_ = call (getSymbol "g_socket_control_message_get_level") (GioSocketControlMessageClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMsgType_ = call (getSymbol "g_socket_control_message_get_msg_type") (GioSocketControlMessageClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSize_ = call (getSymbol "g_socket_control_message_get_size") (GioSocketControlMessageClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
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
        val size = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal =
          (
            GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt64.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
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
    fun getLevel self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
  end
