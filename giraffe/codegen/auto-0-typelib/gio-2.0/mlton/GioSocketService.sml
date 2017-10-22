structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class = 'a GioSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    val getType_ = _import "g_socket_service_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_socket_service_new" : unit -> GioSocketServiceClass.FFI.notnull GioSocketServiceClass.FFI.p;
    val isActive_ = _import "g_socket_service_is_active" : GioSocketServiceClass.FFI.notnull GioSocketServiceClass.FFI.p -> GBool.FFI.val_;
    val start_ = _import "g_socket_service_start" : GioSocketServiceClass.FFI.notnull GioSocketServiceClass.FFI.p -> unit;
    val stop_ = _import "g_socket_service_stop" : GioSocketServiceClass.FFI.notnull GioSocketServiceClass.FFI.p -> unit;
    type 'a class = 'a GioSocketServiceClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketServiceClass.FFI.fromPtr true) new_ ()
    fun isActive self = (GioSocketServiceClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun start self = (GioSocketServiceClass.FFI.withPtr ---> I) start_ self
    fun stop self = (GioSocketServiceClass.FFI.withPtr ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun incomingSig f = signal "incoming" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.tOpt ---> ret boolean) (fn connection & sourceObject => f (connection, sourceObject))
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
    end
  end
