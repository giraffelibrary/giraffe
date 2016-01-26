structure GioProxyAddress :>
  GIO_PROXY_ADDRESS
    where type 'a class_t = 'a GioProxyAddressClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type 'a inet_address_class_t = 'a GioInetAddressClass.t =
  struct
    val getType_ = _import "g_proxy_address_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & x7
         & (x8, x9)
         & (x10, x11) =>
          (
            _import "mlton_g_proxy_address_new" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt16.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt16.C.val_
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val getDestinationHostname_ = _import "g_proxy_address_get_destination_hostname" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDestinationPort_ = _import "g_proxy_address_get_destination_port" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val getPassword_ = _import "g_proxy_address_get_password" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getProtocol_ = _import "g_proxy_address_get_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUsername_ = _import "g_proxy_address_get_username" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    type 'a class_t = 'a GioProxyAddressClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type 'a inet_address_class_t = 'a GioInetAddressClass.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new inetaddr port protocol destHostname destPort username password =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt16.C.withVal
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> GioProxyAddressClass.C.fromPtr true
      )
        new_
        (
          inetaddr
           & port
           & protocol
           & destHostname
           & destPort
           & username
           & password
        )
    fun getDestinationHostname self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDestinationHostname_ self
    fun getDestinationPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getDestinationPort_ self
    fun getPassword self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getPassword_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getProtocol_ self
    fun getUsername self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getUsername_ self
    local
      open Property
    in
      val destinationHostnameProp =
        {
          get = fn x => get "destination-hostname" stringOpt x,
          set = fn x => set "destination-hostname" stringOpt x
        }
      val destinationPortProp =
        {
          get = fn x => get "destination-port" uint x,
          set = fn x => set "destination-port" uint x
        }
      val passwordProp =
        {
          get = fn x => get "password" stringOpt x,
          set = fn x => set "password" stringOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" stringOpt x,
          set = fn x => set "protocol" stringOpt x
        }
      val usernameProp =
        {
          get = fn x => get "username" stringOpt x,
          set = fn x => set "username" stringOpt x
        }
    end
  end
