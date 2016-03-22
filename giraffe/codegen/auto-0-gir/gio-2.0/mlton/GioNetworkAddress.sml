structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class = 'a GioNetworkAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_network_address_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_network_address_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               -> GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHostname_ = _import "g_network_address_get_hostname" : GioNetworkAddressClass.C.notnull GioNetworkAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPort_ = _import "g_network_address_get_port" : GioNetworkAddressClass.C.notnull GioNetworkAddressClass.C.p -> FFI.UInt16.C.val_;
    val getScheme_ = _import "g_network_address_get_scheme" : GioNetworkAddressClass.C.notnull GioNetworkAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a GioNetworkAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hostname port = (Utf8.C.withPtr &&&> FFI.UInt16.C.withVal ---> GioSocketConnectableClass.C.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parse_
        (
          hostAndPort
           & defaultPort
           & []
        )
    fun parseUri uri defaultPort =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GioNetworkAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getHostname_ self
    fun getPort self = (GioNetworkAddressClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
    fun getScheme self = (GioNetworkAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getScheme_ self
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
