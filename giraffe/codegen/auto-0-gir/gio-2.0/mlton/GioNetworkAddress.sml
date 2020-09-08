structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class = 'a GioNetworkAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_network_address_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_network_address_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               -> GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newLoopback_ = _import "g_network_address_new_loopback" : GUInt16.FFI.val_ -> GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p;
    val parse_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_network_address_parse" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_network_address_parse_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHostname_ = _import "g_network_address_get_hostname" : GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPort_ = _import "g_network_address_get_port" : GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p -> GUInt16.FFI.val_;
    val getScheme_ = _import "g_network_address_get_scheme" : GioNetworkAddressClass.FFI.non_opt GioNetworkAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
      open ValueAccessor
    in
      val hostnameProp =
        {
          name = "hostname",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val portProp =
        {
          name = "port",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val schemeProp =
        {
          name = "scheme",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
