structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class = 'a GioProxyAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    val getType_ = _import "g_proxy_address_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & x7
         & (x8, x9)
         & (x10, x11) =>
          (
            _import "mlton_g_proxy_address_new" :
              GioInetAddressClass.C.notnull GioInetAddressClass.C.p
               * FFI.UInt16.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val getDestinationHostname_ = _import "g_proxy_address_get_destination_hostname" : GioProxyAddressClass.C.notnull GioProxyAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getDestinationPort_ = _import "g_proxy_address_get_destination_port" : GioProxyAddressClass.C.notnull GioProxyAddressClass.C.p -> FFI.UInt16.C.val_;
    val getPassword_ = _import "g_proxy_address_get_password" : GioProxyAddressClass.C.notnull GioProxyAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getProtocol_ = _import "g_proxy_address_get_protocol" : GioProxyAddressClass.C.notnull GioProxyAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUsername_ = _import "g_proxy_address_get_username" : GioProxyAddressClass.C.notnull GioProxyAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a GioProxyAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new inetaddr port protocol destHostname destPort username password =
      (
        GioInetAddressClass.C.withPtr
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
    fun getDestinationHostname self = (GioProxyAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getDestinationHostname_ self
    fun getDestinationPort self = (GioProxyAddressClass.C.withPtr ---> FFI.UInt16.C.fromVal) getDestinationPort_ self
    fun getPassword self = (GioProxyAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getPassword_ self
    fun getProtocol self = (GioProxyAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getProtocol_ self
    fun getUsername self = (GioProxyAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getUsername_ self
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
