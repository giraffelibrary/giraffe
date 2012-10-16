structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class_t = 'a GioInetSocketAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type 'a inetaddressclass_t = 'a GioInetAddressClass.t =
  struct
    val getType_ = _import "g_inet_socket_address_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_inet_socket_address_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word16.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getAddress_ = _import "g_inet_socket_address_get_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPort_ = _import "g_inet_socket_address_get_port" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Word16.val_;
    type 'a class_t = 'a GioInetSocketAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type 'a inetaddressclass_t = 'a GioInetAddressClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new address port = (GObjectObjectClass.C.withPtr &&&> FFI.Word16.withVal ---> GioInetSocketAddressClass.C.fromPtr true) new_ (address & port)
    fun getAddress self = (GObjectObjectClass.C.withPtr ---> GioInetAddressClass.C.fromPtr false) getAddress_ self
    fun getPort self = (GObjectObjectClass.C.withPtr ---> FFI.Word16.fromVal) getPort_ self
    local
      open Property
    in
      val addressProp =
        {
          get = fn x => get "address" GioInetAddressClass.tOpt x,
          set = fn x => set "address" GioInetAddressClass.tOpt x
        }
      val portProp =
        {
          get = fn x => get "port" uint x,
          set = fn x => set "port" uint x
        }
    end
  end
