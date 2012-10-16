structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class_t = 'a GioNetworkServiceClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_network_service_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgio "g_network_service_new")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDomain_ = call (load_sym libgio "g_network_service_get_domain") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getProtocol_ = call (load_sym libgio "g_network_service_get_protocol") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getScheme_ = call (load_sym libgio "g_network_service_get_scheme") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getService_ = call (load_sym libgio "g_network_service_get_service") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setScheme_ = call (load_sym libgio "g_network_service_set_scheme") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioNetworkServiceClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new service protocol domain =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDomain_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getProtocol_ self
    fun getScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getScheme_ self
    fun getService self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getService_ self
    fun setScheme self scheme = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setScheme_ (self & scheme)
    local
      open Property
    in
      val domainProp =
        {
          get = fn x => get "domain" stringOpt x,
          set = fn x => set "domain" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          set = fn x => set "protocol" stringOpt x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          set = fn x => set "scheme" stringOpt x
        }
      val serviceProp =
        {
          get = fn x => get "service" stringOpt x,
          set = fn x => set "service" stringOpt x
        }
    end
  end
