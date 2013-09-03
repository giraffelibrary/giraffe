structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class_t = 'a GioProxyAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type 'a inetaddressclass_t = 'a GioInetAddressClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgio "g_proxy_address_new")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt16.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.UInt16.VAL
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDestinationHostname_ = call (load_sym libgio "g_proxy_address_get_destination_hostname") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getDestinationPort_ = call (load_sym libgio "g_proxy_address_get_destination_port") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.UInt16.VAL)
      val getPassword_ = call (load_sym libgio "g_proxy_address_get_password") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getProtocol_ = call (load_sym libgio "g_proxy_address_get_protocol") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getUsername_ = call (load_sym libgio "g_proxy_address_get_username") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
    type 'a class_t = 'a GioProxyAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type 'a inetaddressclass_t = 'a GioInetAddressClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new inetaddr port protocol destHostname destPort username password =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt16.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.UInt16.withVal
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstOptPtr
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
    fun getDestinationHostname self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDestinationHostname_ self
    fun getDestinationPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.fromVal) getDestinationPort_ self
    fun getPassword self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getPassword_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getProtocol_ self
    fun getUsername self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getUsername_ self
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
