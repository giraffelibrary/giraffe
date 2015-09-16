structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class_t = 'a GioSocketServiceClass.t
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_service_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_socket_service_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val isActive_ = call (load_sym libgio "g_socket_service_is_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val start_ = call (load_sym libgio "g_socket_service_start") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val stop_ = call (load_sym libgio "g_socket_service_stop") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSocketServiceClass.t
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketServiceClass.C.fromPtr true) new_ ()
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun start self = (GObjectObjectClass.C.withPtr ---> I) start_ self
    fun stop self = (GObjectObjectClass.C.withPtr ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun incomingSig f = signal "incoming" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.t ---> ret boolean) (fn connection & sourceObject => f connection sourceObject)
    end
  end
