structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class_t = 'a GioNetworkAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t =
  struct
    val getType_ = _import "g_network_address_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_network_address_new" :
              cstring
               * unit CPointer.t
               * FFI.Word16.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Word16.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Word16.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHostname_ = _import "g_network_address_get_hostname" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getPort_ = _import "g_network_address_get_port" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Word16.val_;
    val getScheme_ = _import "g_network_address_get_scheme" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    type 'a class_t = 'a GioNetworkAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hostname port = (FFI.String.withConstPtr &&&> FFI.Word16.withVal ---> GioSocketConnectableClass.C.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        FFI.String.withConstPtr
         &&&> FFI.Word16.withVal
         &&&> GLibErrorRecord.C.handleError
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
        FFI.String.withConstPtr
         &&&> FFI.Word16.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getHostname_ self
    fun getPort self = (GObjectObjectClass.C.withPtr ---> FFI.Word16.fromVal) getPort_ self
    fun getScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getScheme_ self
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
