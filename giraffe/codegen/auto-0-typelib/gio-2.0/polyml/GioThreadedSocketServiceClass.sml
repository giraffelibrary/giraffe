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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_threaded_socket_service_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
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
