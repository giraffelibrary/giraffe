structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class_t = 'a GioInetSocketAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type 'a inetaddressclass_t = 'a GioInetAddressClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_inet_socket_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_inet_socket_address_new") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt16.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getAddress_ = call (load_sym libgio "g_inet_socket_address_get_address") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPort_ = call (load_sym libgio "g_inet_socket_address_get_port") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
    end
    type 'a class_t = 'a GioInetSocketAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type 'a inetaddressclass_t = 'a GioInetAddressClass.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new address port = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> GioInetSocketAddressClass.C.fromPtr true) new_ (address & port)
    fun getAddress self = (GObjectObjectClass.C.withPtr ---> GioInetAddressClass.C.fromPtr false) getAddress_ self
    fun getPort self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPort_ self
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
