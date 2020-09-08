structure GioThreadedSocketService :>
  GIO_THREADED_SOCKET_SERVICE
    where type 'a class = 'a GioThreadedSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    val getType_ = _import "g_threaded_socket_service_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_threaded_socket_service_new" : GInt32.FFI.val_ -> GioSocketServiceClass.FFI.non_opt GioSocketServiceClass.FFI.p;
    type 'a class = 'a GioThreadedSocketServiceClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new maxThreads = (GInt32.FFI.withVal ---> GioThreadedSocketServiceClass.FFI.fromPtr true) new_ maxThreads
    local
      open ClosureMarshal Signal
    in
      fun runSig f = signal "run" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.t ---> ret boolean) (fn connection & sourceObject => f (connection, sourceObject))
    end
    local
      open ValueAccessor
    in
      val maxThreadsProp =
        {
          name = "max-threads",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
