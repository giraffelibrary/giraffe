structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class = 'a GioInetSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    val getType_ = _import "g_inet_socket_address_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_inet_socket_address_new" : GioInetAddressClass.C.notnull GioInetAddressClass.C.p * FFI.UInt16.C.val_ -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;) (x1, x2)
    val getAddress_ = _import "g_inet_socket_address_get_address" : GioInetSocketAddressClass.C.notnull GioInetSocketAddressClass.C.p -> GioInetAddressClass.C.notnull GioInetAddressClass.C.p;
    val getPort_ = _import "g_inet_socket_address_get_port" : GioInetSocketAddressClass.C.notnull GioInetSocketAddressClass.C.p -> FFI.UInt16.C.val_;
    type 'a class = 'a GioInetSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new address port = (GioInetAddressClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> GioInetSocketAddressClass.C.fromPtr true) new_ (address & port)
    fun getAddress self = (GioInetSocketAddressClass.C.withPtr ---> GioInetAddressClass.C.fromPtr false) getAddress_ self
    fun getPort self = (GioInetSocketAddressClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
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
