structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class = 'a GioProxyAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    val getType_ = _import "g_proxy_address_get_type" : unit -> GObjectType.FFI.val_;
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
              GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p
               * GUInt16.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;
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
    val getDestinationHostname_ = _import "g_proxy_address_get_destination_hostname" : GioProxyAddressClass.FFI.notnull GioProxyAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getDestinationPort_ = _import "g_proxy_address_get_destination_port" : GioProxyAddressClass.FFI.notnull GioProxyAddressClass.FFI.p -> GUInt16.FFI.val_;
    val getPassword_ = _import "g_proxy_address_get_password" : GioProxyAddressClass.FFI.notnull GioProxyAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getProtocol_ = _import "g_proxy_address_get_protocol" : GioProxyAddressClass.FFI.notnull GioProxyAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUsername_ = _import "g_proxy_address_get_username" : GioProxyAddressClass.FFI.notnull GioProxyAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type 'a class = 'a GioProxyAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
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
