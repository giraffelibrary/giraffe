structure GioNetworkAddress :>
  GIO_NETWORK_ADDRESS
    where type 'a class_t = 'a GioNetworkAddressClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_network_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_network_address_new") (FFI.String.PolyML.INPTR &&> FFI.UInt16.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val parse_ =
        call (load_sym libgio "g_network_address_parse")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.UInt16.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val parseUri_ =
        call (load_sym libgio "g_network_address_parse_uri")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.UInt16.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getHostname_ = call (load_sym libgio "g_network_address_get_hostname") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPort_ = call (load_sym libgio "g_network_address_get_port") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val getScheme_ = call (load_sym libgio "g_network_address_get_scheme") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a GioNetworkAddressClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hostname port = (FFI.String.C.withConstPtr &&&> FFI.UInt16.C.withVal ---> GioSocketConnectableClass.C.fromPtr true) new_ (hostname & port)
    fun parse hostAndPort defaultPort =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt16.C.withVal
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
        FFI.String.C.withConstPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        parseUri_
        (
          uri
           & defaultPort
           & []
        )
    fun getHostname self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getHostname_ self
    fun getPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
    fun getScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getScheme_ self
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
