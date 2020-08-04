structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class = 'a GioNetworkAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_network_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_network_address_new") (Utf8.PolyML.cInPtr &&> GUInt16.PolyML.cVal --> GioNetworkAddressClass.PolyML.cPtr)
      val newLoopback_ = call (getSymbol "g_network_address_new_loopback") (GUInt16.PolyML.cVal --> GioNetworkAddressClass.PolyML.cPtr)
      val parse_ =
        call (getSymbol "g_network_address_parse")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioNetworkAddressClass.PolyML.cPtr
          )
      val parseUri_ =
        call (getSymbol "g_network_address_parse_uri")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioNetworkAddressClass.PolyML.cPtr
          )
      val getHostname_ = call (getSymbol "g_network_address_get_hostname") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPort_ = call (getSymbol "g_network_address_get_port") (GioNetworkAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getScheme_ = call (getSymbol "g_network_address_get_scheme") (GioNetworkAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioNetworkAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hostname, port) = (Utf8.FFI.withPtr 0 &&&> GUInt16.FFI.withVal ---> GioNetworkAddressClass.FFI.fromPtr true) new_ (hostname & port)
    fun newLoopback port = (GUInt16.FFI.withVal ---> GioNetworkAddressClass.FFI.fromPtr true) newLoopback_ port
    fun parse (hostAndPort, defaultPort) =
      (
        Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioNetworkAddressClass.FFI.fromPtr true
      )
        parse_
        (
          hostAndPort
           & defaultPort
           & []
        )
    fun parseUri (uri, defaultPort) =
      (
        Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioNetworkAddressClass.FFI.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GioNetworkAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getHostname_ self
    fun getPort self = (GioNetworkAddressClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getPort_ self
    fun getScheme self = (GioNetworkAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getScheme_ self
    local
      open Property
    in
      val hostnameProp =
        {
          get = fn x => get "hostname" stringOpt x,
          new = fn x => new "hostname" stringOpt x
        }
      val portProp =
        {
          get = fn x => get "port" uint x,
          new = fn x => new "port" uint x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          new = fn x => new "scheme" stringOpt x
        }
    end
  end
