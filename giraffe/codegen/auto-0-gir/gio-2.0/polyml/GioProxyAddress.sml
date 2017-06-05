structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class = 'a GioProxyAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_address_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_proxy_address_new")
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
      val getDestinationHostname_ = call (load_sym libgio "g_proxy_address_get_destination_hostname") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDestinationPort_ = call (load_sym libgio "g_proxy_address_get_destination_port") (GioProxyAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getPassword_ = call (load_sym libgio "g_proxy_address_get_password") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProtocol_ = call (load_sym libgio "g_proxy_address_get_protocol") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUsername_ = call (load_sym libgio "g_proxy_address_get_username") (GioProxyAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioProxyAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new inetaddr port protocol destHostname destPort username password =
      (
        GioInetAddressClass.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun getDestinationHostname self = (GioProxyAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDestinationHostname_ self
    fun getDestinationPort self = (GioProxyAddressClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getDestinationPort_ self
    fun getPassword self = (GioProxyAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPassword_ self
    fun getProtocol self = (GioProxyAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getProtocol_ self
    fun getUsername self = (GioProxyAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUsername_ self
    local
      open Property
    in
      val destinationHostnameProp =
        {
          get = fn x => get "destination-hostname" stringOpt x,
          set = fn x => set "destination-hostname" stringOpt x
        }
      val destinationPortProp =
        {
          get = fn x => get "destination-port" uint x,
          set = fn x => set "destination-port" uint x
        }
      val passwordProp =
        {
          get = fn x => get "password" stringOpt x,
          set = fn x => set "password" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          set = fn x => set "protocol" stringOpt x
        }
      val usernameProp =
        {
          get = fn x => get "username" stringOpt x,
          set = fn x => set "username" stringOpt x
        }
    end
  end
