structure GioThreadedSocketServiceClass :>
  GIO_THREADED_SOCKET_SERVICE_CLASS
    where type 'a socket_service_class = 'a GioSocketServiceClass.class
    where type C.opt = GioSocketServiceClass.C.opt
    where type C.non_opt = GioSocketServiceClass.C.non_opt
    where type 'a C.p = 'a GioSocketServiceClass.C.p =
  struct
    type 'a socket_service_class = 'a GioSocketServiceClass.class
    open GioSocketServiceClass
    type 'a threaded_socket_service = unit
    type 'a class = 'a threaded_socket_service class
    val getType_ = _import "g_threaded_socket_service_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
