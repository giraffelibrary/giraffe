structure GioSocketControlMessage :>
  GIO_SOCKET_CONTROL_MESSAGE
    where type 'a class = 'a GioSocketControlMessageClass.class =
  struct
    val getType_ = _import "g_socket_control_message_get_type" : unit -> GObjectType.FFI.val_;
    val deserialize_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_socket_control_message_deserialize" :
              GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt64.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               -> GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getLevel_ = _import "g_socket_control_message_get_level" : GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p -> GInt32.FFI.val_;
    val getMsgType_ = _import "g_socket_control_message_get_msg_type" : GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p -> GInt32.FFI.val_;
    val getSize_ = _import "g_socket_control_message_get_size" : GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p -> GUInt64.FFI.val_;
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
            GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt64.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
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
    fun getLevel self = (GioSocketControlMessageClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getLevel_ self
    fun getMsgType self = (GioSocketControlMessageClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMsgType_ self
    fun getSize self = (GioSocketControlMessageClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getSize_ self
  end
