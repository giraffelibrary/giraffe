structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class = 'a GioNetworkServiceClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_network_service_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_network_service_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDomain_ = _import "g_network_service_get_domain" : GioNetworkServiceClass.C.notnull GioNetworkServiceClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getProtocol_ = _import "g_network_service_get_protocol" : GioNetworkServiceClass.C.notnull GioNetworkServiceClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getScheme_ = _import "g_network_service_get_scheme" : GioNetworkServiceClass.C.notnull GioNetworkServiceClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getService_ = _import "g_network_service_get_service" : GioNetworkServiceClass.C.notnull GioNetworkServiceClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_network_service_set_scheme" :
              GioNetworkServiceClass.C.notnull GioNetworkServiceClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioNetworkServiceClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new service protocol domain =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getDomain_ self
    fun getProtocol self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getProtocol_ self
    fun getScheme self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getScheme_ self
    fun getService self = (GioNetworkServiceClass.C.withPtr ---> Utf8.C.fromPtr false) getService_ self
    fun setScheme self scheme = (GioNetworkServiceClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setScheme_ (self & scheme)
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
