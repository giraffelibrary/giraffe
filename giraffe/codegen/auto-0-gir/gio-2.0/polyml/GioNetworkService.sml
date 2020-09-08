structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class = 'a GioNetworkServiceClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_network_service_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_network_service_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioNetworkServiceClass.PolyML.cPtr
          )
      val getDomain_ = call (getSymbol "g_network_service_get_domain") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProtocol_ = call (getSymbol "g_network_service_get_protocol") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScheme_ = call (getSymbol "g_network_service_get_scheme") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getService_ = call (getSymbol "g_network_service_get_service") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setScheme_ = call (getSymbol "g_network_service_set_scheme") (GioNetworkServiceClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioNetworkServiceClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        service,
        protocol,
        domain
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GioNetworkServiceClass.FFI.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GioNetworkServiceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDomain_ self
    fun getProtocol self = (GioNetworkServiceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getProtocol_ self
    fun getScheme self = (GioNetworkServiceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getScheme_ self
    fun getService self = (GioNetworkServiceClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getService_ self
    fun setScheme self scheme = (GioNetworkServiceClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setScheme_ (self & scheme)
    local
      open ValueAccessor
    in
      val domainProp =
        {
          name = "domain",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val protocolProp =
        {
          name = "protocol",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val schemeProp =
        {
          name = "scheme",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val serviceProp =
        {
          name = "service",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
