structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class = 'a GioInetSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    val getType_ = _import "g_inet_socket_address_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_inet_socket_address_new" : GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p * GUInt16.FFI.val_ -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getAddress_ = _import "g_inet_socket_address_get_address" : GioInetSocketAddressClass.FFI.notnull GioInetSocketAddressClass.FFI.p -> GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p;
    val getPort_ = _import "g_inet_socket_address_get_port" : GioInetSocketAddressClass.FFI.notnull GioInetSocketAddressClass.FFI.p -> GUInt16.FFI.val_;
    type 'a class = 'a GioInetSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (address, port) = (GioInetAddressClass.FFI.withPtr &&&> GUInt16.FFI.withVal ---> GioInetSocketAddressClass.FFI.fromPtr true) new_ (address & port)
    fun getAddress self = (GioInetSocketAddressClass.FFI.withPtr ---> GioInetAddressClass.FFI.fromPtr false) getAddress_ self
    fun getPort self = (GioInetSocketAddressClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getPort_ self
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
