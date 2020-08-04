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
              GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p
               * GUInt16.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
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
    val getDestinationHostname_ = _import "g_proxy_address_get_destination_hostname" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDestinationPort_ = _import "g_proxy_address_get_destination_port" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> GUInt16.FFI.val_;
    val getDestinationProtocol_ = _import "g_proxy_address_get_destination_protocol" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPassword_ = _import "g_proxy_address_get_password" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getProtocol_ = _import "g_proxy_address_get_protocol" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUri_ = _import "g_proxy_address_get_uri" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUsername_ = _import "g_proxy_address_get_username" : GioProxyAddressClass.FFI.non_opt GioProxyAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
      open Property
    in
      val destinationHostnameProp =
        {
          get = fn x => get "destination-hostname" stringOpt x,
          new = fn x => new "destination-hostname" stringOpt x
        }
      val destinationPortProp =
        {
          get = fn x => get "destination-port" uint x,
          new = fn x => new "destination-port" uint x
        }
      val destinationProtocolProp =
        {
          get = fn x => get "destination-protocol" stringOpt x,
          new = fn x => new "destination-protocol" stringOpt x
        }
      val passwordProp =
        {
          get = fn x => get "password" stringOpt x,
          new = fn x => new "password" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          new = fn x => new "protocol" stringOpt x
        }
      val uriProp =
        {
          get = fn x => get "uri" stringOpt x,
          new = fn x => new "uri" stringOpt x
        }
      val usernameProp =
        {
          get = fn x => get "username" stringOpt x,
          new = fn x => new "username" stringOpt x
        }
    end
  end
