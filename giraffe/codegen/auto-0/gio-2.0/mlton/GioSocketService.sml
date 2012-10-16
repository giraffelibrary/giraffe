structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class_t = 'a GioSocketServiceClass.t
    where type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t =
  struct
    val getType_ = _import "g_socket_service_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_socket_service_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isActive_ = _import "g_socket_service_is_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val start_ = _import "g_socket_service_start" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val stop_ = _import "g_socket_service_stop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioSocketServiceClass.t
    type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketServiceClass.C.fromPtr true) new_ ()
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isActive_ self
    fun start self = (GObjectObjectClass.C.withPtr ---> I) start_ self
    fun stop self = (GObjectObjectClass.C.withPtr ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun incomingSig f = signal "incoming" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.t ---> ret boolean) (fn connection & sourceObject => f connection sourceObject)
    end
  end
