structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class = 'a GioNetworkServiceClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_network_service_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_network_service_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GioSocketConnectableClass.PolyML.cPtr
          )
      val getDomain_ = call (load_sym libgio "g_network_service_get_domain") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProtocol_ = call (load_sym libgio "g_network_service_get_protocol") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScheme_ = call (load_sym libgio "g_network_service_get_scheme") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getService_ = call (load_sym libgio "g_network_service_get_service") (GioNetworkServiceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setScheme_ = call (load_sym libgio "g_network_service_set_scheme") (GioNetworkServiceClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioNetworkServiceClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new service protocol domain =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getDomain_ self
    fun getProtocol self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getProtocol_ self
    fun getScheme self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getScheme_ self
    fun getService self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getService_ self
    fun setScheme self scheme = (GioNetworkServiceClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setScheme_ (self & scheme)
    local
      open Property
    in
      val domainProp =
        {
          get = fn x => get "domain" stringOpt x,
          set = fn x => set "domain" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          set = fn x => set "protocol" stringOpt x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          set = fn x => set "scheme" stringOpt x
        }
      val serviceProp =
        {
          get = fn x => get "service" stringOpt x,
          set = fn x => set "service" stringOpt x
        }
    end
  end
