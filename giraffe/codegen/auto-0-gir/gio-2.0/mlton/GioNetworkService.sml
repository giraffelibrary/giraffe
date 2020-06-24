structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class = 'a GioNetworkServiceClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_network_service_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_network_service_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDomain_ = _import "g_network_service_get_domain" : GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getProtocol_ = _import "g_network_service_get_protocol" : GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getScheme_ = _import "g_network_service_get_scheme" : GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getService_ = _import "g_network_service_get_service" : GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_network_service_set_scheme" :
              GioNetworkServiceClass.FFI.non_opt GioNetworkServiceClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        service,
        protocol,
        domain
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioNetworkServiceClass.FFI.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GioNetworkServiceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDomain_ self
    fun getProtocol self = (GioNetworkServiceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getProtocol_ self
    fun getScheme self = (GioNetworkServiceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getScheme_ self
    fun getService self = (GioNetworkServiceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getService_ self
    fun setScheme self scheme = (GioNetworkServiceClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setScheme_ (self & scheme)
    local
      open Property
    in
      val domainProp =
        {
          get = fn x => get "domain" stringOpt x,
          new = fn x => new "domain" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          new = fn x => new "protocol" stringOpt x
        }
      val schemeProp =
        {
          get = fn x => get "scheme" stringOpt x,
          set = fn x => set "scheme" stringOpt x,
          new = fn x => new "scheme" stringOpt x
        }
      val serviceProp =
        {
          get = fn x => get "service" stringOpt x,
          new = fn x => new "service" stringOpt x
        }
    end
  end
