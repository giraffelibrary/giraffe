structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class = 'a GioSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    val getType_ = _import "g_socket_service_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_socket_service_new" : unit -> GioSocketServiceClass.C.notnull GioSocketServiceClass.C.p;
    val isActive_ = _import "g_socket_service_is_active" : GioSocketServiceClass.C.notnull GioSocketServiceClass.C.p -> FFI.Bool.C.val_;
    val start_ = _import "g_socket_service_start" : GioSocketServiceClass.C.notnull GioSocketServiceClass.C.p -> unit;
    val stop_ = _import "g_socket_service_stop" : GioSocketServiceClass.C.notnull GioSocketServiceClass.C.p -> unit;
    type 'a class = 'a GioSocketServiceClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketServiceClass.C.fromPtr true) new_ ()
    fun isActive self = (GioSocketServiceClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun start self = (GioSocketServiceClass.C.withPtr ---> I) start_ self
    fun stop self = (GioSocketServiceClass.C.withPtr ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun incomingSig f = signal "incoming" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.t ---> ret boolean) (fn connection & sourceObject => f connection sourceObject)
    end
  end
