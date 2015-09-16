structure GioThreadedSocketService :>
  GIO_THREADED_SOCKET_SERVICE
    where type 'a class_t = 'a GioThreadedSocketServiceClass.t
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_threaded_socket_service_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_threaded_socket_service_new") (FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioThreadedSocketServiceClass.t
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new maxThreads = (FFI.Int32.C.withVal ---> GioThreadedSocketServiceClass.C.fromPtr true) new_ maxThreads
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
