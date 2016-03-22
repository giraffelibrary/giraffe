structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class = 'a GioInetSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_inet_socket_address_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_inet_socket_address_new") (GioInetAddressClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> GioSocketAddressClass.PolyML.cPtr)
      val getAddress_ = call (load_sym libgio "g_inet_socket_address_get_address") (GioInetSocketAddressClass.PolyML.cPtr --> GioInetAddressClass.PolyML.cPtr)
      val getPort_ = call (load_sym libgio "g_inet_socket_address_get_port") (GioInetSocketAddressClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
    end
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
