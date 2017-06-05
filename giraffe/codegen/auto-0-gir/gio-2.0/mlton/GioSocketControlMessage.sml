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
    val getType_ = _import "g_socket_control_message_get_type" : unit -> GObjectType.FFI.val_;
    val deserialize_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_socket_control_message_deserialize" :
              GInt.FFI.val_
               * GInt.FFI.val_
               * GSize.FFI.val_
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               -> GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getLevel_ = _import "g_socket_control_message_get_level" : GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p -> GInt.FFI.val_;
    val getMsgType_ = _import "g_socket_control_message_get_msg_type" : GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p -> GInt.FFI.val_;
    val getSize_ = _import "g_socket_control_message_get_size" : GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p -> GSize.FFI.val_;
    type 'a class = 'a GioSocketControlMessageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deserialize level type' data =
      let
        val size = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal =
          (
            GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GSize.FFI.withVal
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
    fun getLevel self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt.FFI.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.FFI.withPtr ---> GInt.FFI.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.FFI.withPtr ---> GSize.FFI.fromVal) getSize_ self
  end
