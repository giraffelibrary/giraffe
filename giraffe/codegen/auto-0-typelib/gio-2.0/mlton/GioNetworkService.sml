structure GioNetworkService :>
  GIO_NETWORK_SERVICE
    where type 'a class_t = 'a GioNetworkServiceClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t =
  struct
    val getType_ = _import "g_network_service_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_network_service_new" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDomain_ = _import "g_network_service_get_domain" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getProtocol_ = _import "g_network_service_get_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getScheme_ = _import "g_network_service_get_scheme" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getService_ = _import "g_network_service_get_service" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val setScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_network_service_set_scheme" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioNetworkServiceClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new service protocol domain =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> GioSocketConnectableClass.C.fromPtr true
      )
        new_
        (
          service
           & protocol
           & domain
        )
    fun getDomain self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDomain_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getProtocol_ self
    fun getScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getScheme_ self
    fun getService self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getService_ self
    fun setScheme self scheme = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setScheme_ (self & scheme)
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
