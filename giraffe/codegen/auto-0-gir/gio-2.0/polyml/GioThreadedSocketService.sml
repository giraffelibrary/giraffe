structure GioThreadedSocketService :>
  GIO_THREADED_SOCKET_SERVICE
    where type 'a class = 'a GioThreadedSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_threaded_socket_service_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_threaded_socket_service_new") (GInt.PolyML.cVal --> GioSocketServiceClass.PolyML.cPtr)
    end
    type 'a class = 'a GioThreadedSocketServiceClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new maxThreads = (GInt.FFI.withVal ---> GioThreadedSocketServiceClass.FFI.fromPtr true) new_ maxThreads
    local
      open ClosureMarshal Signal
    in
      fun runSig f = signal "run" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.t ---> ret boolean) (fn connection & sourceObject => f connection sourceObject)
    end
    local
      open Property
    in
      val maxThreadsProp =
        {
          get = fn x => get "max-threads" int x,
          set = fn x => set "max-threads" int x
        }
    end
  end
