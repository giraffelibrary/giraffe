structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class_t = 'a GioNetworkAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_network_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_network_address_new") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Word16.VAL --> GObjectObjectClass.PolyML.PTR)
      val parse_ =
        call (load_sym libgio "g_network_address_parse")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word16.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val parseUri_ =
        call (load_sym libgio "g_network_address_parse_uri")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word16.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getHostname_ = call (load_sym libgio "g_network_address_get_hostname") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getPort_ = call (load_sym libgio "g_network_address_get_port") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Word16.VAL)
      val getScheme_ = call (load_sym libgio "g_network_address_get_scheme") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
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
