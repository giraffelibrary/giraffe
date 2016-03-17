structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class = 'a GioProxyAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_address_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_proxy_address_new")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getDestinationHostname_ = call (load_sym libgio "g_proxy_address_get_destination_hostname") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDestinationPort_ = call (load_sym libgio "g_proxy_address_get_destination_port") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getPassword_ = call (load_sym libgio "g_proxy_address_get_password") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProtocol_ = call (load_sym libgio "g_proxy_address_get_protocol") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUsername_ = call (load_sym libgio "g_proxy_address_get_username") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioProxyAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new inetaddr port protocol destHostname destPort username password =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GioProxyAddressClass.C.fromPtr true
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
    fun getDestinationHostname self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDestinationHostname_ self
    fun getDestinationPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getDestinationPort_ self
    fun getPassword self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPassword_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getProtocol_ self
    fun getUsername self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getUsername_ self
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
