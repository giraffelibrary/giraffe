structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class = 'a GioNetworkAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_network_address_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_network_address_new") (Utf8.PolyML.cInPtr &&> FFI.UInt16.PolyML.cVal --> GioSocketConnectableClass.PolyML.cPtr)
      val parse_ =
        call (load_sym libgio "g_network_address_parse")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectableClass.PolyML.cPtr
          )
      val parseUri_ =
        call (load_sym libgio "g_network_address_parse_uri")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectableClass.PolyML.cPtr
          )
      val getHostname_ = call (load_sym libgio "g_network_address_get_hostname") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPort_ = call (load_sym libgio "g_network_address_get_port") (GioNetworkAddressClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getScheme_ = call (load_sym libgio "g_network_address_get_scheme") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioNetworkAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hostname port = (Utf8.C.withPtr &&&> FFI.UInt16.C.withVal ---> GioSocketConnectableClass.C.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parse_
        (
          hostAndPort
           & defaultPort
           & []
        )
    fun parseUri uri defaultPort =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GioNetworkAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getHostname_ self
    fun getPort self = (GioNetworkAddressClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
    fun getScheme self = (GioNetworkAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getScheme_ self
    local
      open Property
    in
      val hostnameProp =
        {
          get = fn x => get "hostname" stringOpt x,
          set = fn x => set "hostname" stringOpt x
        }
      val portProp =
        {
          get = fn x => get "port" uint x,
          set = fn x => set "port" uint x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          set = fn x => set "scheme" stringOpt x
        }
    end
  end
