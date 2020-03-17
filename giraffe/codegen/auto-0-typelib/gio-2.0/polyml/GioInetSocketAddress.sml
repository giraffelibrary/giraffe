structure GioInetSocketAddress :>
  GIO_INET_SOCKET_ADDRESS
    where type 'a class = 'a GioInetSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_inet_socket_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_inet_socket_address_new") (GioInetAddressClass.PolyML.cPtr &&> GUInt16.PolyML.cVal --> GioSocketAddressClass.PolyML.cPtr)
      val newFromString_ = call (getSymbol "g_inet_socket_address_new_from_string") (Utf8.PolyML.cInPtr &&> GUInt32.PolyML.cVal --> GioSocketAddressClass.PolyML.cOptPtr)
      val getAddress_ = call (getSymbol "g_inet_socket_address_get_address") (GioInetSocketAddressClass.PolyML.cPtr --> GioInetAddressClass.PolyML.cPtr)
      val getFlowinfo_ = call (getSymbol "g_inet_socket_address_get_flowinfo") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getPort_ = call (getSymbol "g_inet_socket_address_get_port") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getScopeId_ = call (getSymbol "g_inet_socket_address_get_scope_id") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
    end
    type 'a class = 'a GioInetSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (address, port) = (GioInetAddressClass.FFI.withPtr &&&> GUInt16.FFI.withVal ---> GioInetSocketAddressClass.FFI.fromPtr true) new_ (address & port)
    fun newFromString (address, port) = (Utf8.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GioInetSocketAddressClass.FFI.fromOptPtr true) newFromString_ (address & port)
    fun getAddress self = (GioInetSocketAddressClass.FFI.withPtr ---> GioInetAddressClass.FFI.fromPtr false) getAddress_ self
    fun getFlowinfo self = (GioInetSocketAddressClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getFlowinfo_ self
    fun getPort self = (GioInetSocketAddressClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getPort_ self
    fun getScopeId self = (GioInetSocketAddressClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getScopeId_ self
    local
      open Property
    in
      val addressProp =
        {
          get = fn x => get "address" GioInetAddressClass.tOpt x,
          new = fn x => new "address" GioInetAddressClass.tOpt x
        }
      val flowinfoProp =
        {
          get = fn x => get "flowinfo" uint x,
          new = fn x => new "flowinfo" uint x
        }
      val portProp =
        {
          get = fn x => get "port" uint x,
          new = fn x => new "port" uint x
        }
      val scopeIdProp =
        {
          get = fn x => get "scope-id" uint x,
          new = fn x => new "scope-id" uint x
        }
    end
  end
