structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class = 'a GioSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_service_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_socket_service_new") (FFI.PolyML.cVoid --> GioSocketServiceClass.PolyML.cPtr)
      val isActive_ = call (load_sym libgio "g_socket_service_is_active") (GioSocketServiceClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val start_ = call (load_sym libgio "g_socket_service_start") (GioSocketServiceClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val stop_ = call (load_sym libgio "g_socket_service_stop") (GioSocketServiceClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
