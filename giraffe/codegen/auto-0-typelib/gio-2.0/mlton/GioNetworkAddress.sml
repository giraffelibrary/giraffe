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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               -> GioSocketConnectableClass.FFI.notnull GioSocketConnectableClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val parse_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_network_address_parse" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectableClass.FFI.notnull GioSocketConnectableClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectableClass.FFI.notnull GioSocketConnectableClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHostname_ = _import "g_network_address_get_hostname" : GioNetworkAddressClass.FFI.notnull GioNetworkAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPort_ = _import "g_network_address_get_port" : GioNetworkAddressClass.FFI.notnull GioNetworkAddressClass.FFI.p -> GUInt16.FFI.val_;
    val getScheme_ = _import "g_network_address_get_scheme" : GioNetworkAddressClass.FFI.notnull GioNetworkAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
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
