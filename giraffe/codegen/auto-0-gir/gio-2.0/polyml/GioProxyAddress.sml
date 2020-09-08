structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class = 'a GioProxyAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_proxy_address_new")
          (
            GioInetAddressClass.PolyML.cPtr
             &&> GUInt16.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val getDestinationHostname_ = call (getSymbol "g_proxy_address_get_destination_hostname") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDestinationPort_ = call (getSymbol "g_proxy_address_get_destination_port") (GioProxyAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getDestinationProtocol_ = call (getSymbol "g_proxy_address_get_destination_protocol") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPassword_ = call (getSymbol "g_proxy_address_get_password") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProtocol_ = call (getSymbol "g_proxy_address_get_protocol") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (getSymbol "g_proxy_address_get_uri") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUsername_ = call (getSymbol "g_proxy_address_get_username") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioProxyAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        inetaddr,
        port,
        protocol,
        destHostname,
        destPort,
        username,
        password
      ) =
      (
        GioInetAddressClass.FFI.withPtr false
         &&&> GUInt16.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GioProxyAddressClass.FFI.fromPtr true
      )
        new_
        (
          inetaddr
           & port
           & protocol
           & destHostname
           & destPort
           & username
           & password
        )
    fun getDestinationHostname self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDestinationHostname_ self
    fun getDestinationPort self = (GioProxyAddressClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getDestinationPort_ self
    fun getDestinationProtocol self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDestinationProtocol_ self
    fun getPassword self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPassword_ self
    fun getProtocol self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getProtocol_ self
    fun getUri self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUri_ self
    fun getUsername self = (GioProxyAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUsername_ self
    local
      open ValueAccessor
    in
      val destinationHostnameProp =
        {
          name = "destination-hostname",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val destinationPortProp =
        {
          name = "destination-port",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val destinationProtocolProp =
        {
          name = "destination-protocol",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val passwordProp =
        {
          name = "password",
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
      val uriProp =
        {
          name = "uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val usernameProp =
        {
          name = "username",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
