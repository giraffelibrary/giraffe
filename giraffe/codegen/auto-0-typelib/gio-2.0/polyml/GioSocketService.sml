structure GioSocketService :>
  GIO_SOCKET_SERVICE
    where type 'a class = 'a GioSocketServiceClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_service_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_socket_service_new") (cVoid --> GioSocketServiceClass.PolyML.cPtr)
      val isActive_ = call (getSymbol "g_socket_service_is_active") (GioSocketServiceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val start_ = call (getSymbol "g_socket_service_start") (GioSocketServiceClass.PolyML.cPtr --> cVoid)
      val stop_ = call (getSymbol "g_socket_service_stop") (GioSocketServiceClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioSocketServiceClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketServiceClass.FFI.fromPtr true) new_ ()
    fun isActive self = (GioSocketServiceClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActive_ self
    fun start self = (GioSocketServiceClass.FFI.withPtr false ---> I) start_ self
    fun stop self = (GioSocketServiceClass.FFI.withPtr false ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun incomingSig f = signal "incoming" (get 0w1 GioSocketConnectionClass.t &&&> get 0w2 GObjectObjectClass.tOpt ---> ret boolean) (fn connection & sourceObject => f (connection, sourceObject))
    end
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
