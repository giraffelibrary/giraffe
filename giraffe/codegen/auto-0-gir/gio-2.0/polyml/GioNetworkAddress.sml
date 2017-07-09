structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class = 'a GioNetworkAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_network_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_network_address_new") (Utf8.PolyML.cInPtr &&> GUInt16.PolyML.cVal --> GioSocketConnectableClass.PolyML.cPtr)
      val parse_ =
        call (getSymbol "g_network_address_parse")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectableClass.PolyML.cPtr
          )
      val parseUri_ =
        call (getSymbol "g_network_address_parse_uri")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectableClass.PolyML.cPtr
          )
      val getHostname_ = call (getSymbol "g_network_address_get_hostname") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPort_ = call (getSymbol "g_network_address_get_port") (GioNetworkAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getScheme_ = call (getSymbol "g_network_address_get_scheme") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioNetworkAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new hostname port = (Utf8.FFI.withPtr &&&> GUInt16.FFI.withVal ---> GioSocketConnectableClass.FFI.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        Utf8.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.FFI.fromPtr true
      )
        parse_
        (
          hostAndPort
           & defaultPort
           & []
        )
    fun parseUri uri defaultPort =
      (
        Utf8.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.FFI.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GioNetworkAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getHostname_ self
    fun getPort self = (GioNetworkAddressClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getPort_ self
    fun getScheme self = (GioNetworkAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getScheme_ self
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
