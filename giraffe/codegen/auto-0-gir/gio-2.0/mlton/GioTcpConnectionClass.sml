structure GioTcpConnectionClass :>
  GIO_TCP_CONNECTION_CLASS
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type C.opt = GioSocketConnectionClass.C.opt
    where type C.non_opt = GioSocketConnectionClass.C.non_opt
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    open GioSocketConnectionClass
    type 'a tcp_connection = unit
    type 'a class = 'a tcp_connection class
    val getType_ = _import "g_tcp_connection_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
