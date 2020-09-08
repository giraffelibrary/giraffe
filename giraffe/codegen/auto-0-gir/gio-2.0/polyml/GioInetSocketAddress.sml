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
      val newFromString_ = call (getSymbol "g_inet_socket_address_new_from_string") (Utf8.PolyML.cInPtr &&> GUInt.PolyML.cVal --> GioSocketAddressClass.PolyML.cOptPtr)
      val getAddress_ = call (getSymbol "g_inet_socket_address_get_address") (GioInetSocketAddressClass.PolyML.cPtr --> GioInetAddressClass.PolyML.cPtr)
      val getFlowinfo_ = call (getSymbol "g_inet_socket_address_get_flowinfo") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getPort_ = call (getSymbol "g_inet_socket_address_get_port") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getScopeId_ = call (getSymbol "g_inet_socket_address_get_scope_id") (GioInetSocketAddressClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
    end
    type 'a class = 'a GioInetSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (address, port) = (GioInetAddressClass.FFI.withPtr false &&&> GUInt16.FFI.withVal ---> GioInetSocketAddressClass.FFI.fromPtr true) new_ (address & port)
    fun newFromString (address, port) = (Utf8.FFI.withPtr 0 &&&> GUInt.FFI.withVal ---> GioInetSocketAddressClass.FFI.fromOptPtr true) newFromString_ (address & port)
    fun getAddress self = (GioInetSocketAddressClass.FFI.withPtr false ---> GioInetAddressClass.FFI.fromPtr false) getAddress_ self
    fun getFlowinfo self = (GioInetSocketAddressClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getFlowinfo_ self
    fun getPort self = (GioInetSocketAddressClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getPort_ self
    fun getScopeId self = (GioInetSocketAddressClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getScopeId_ self
    local
      open ValueAccessor
    in
      val addressProp =
        {
          name = "address",
          gtype = fn () => C.gtype GioInetAddressClass.tOpt (),
          get = fn x => fn () => C.get GioInetAddressClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioInetAddressClass.tOpt x
        }
      val flowinfoProp =
        {
          name = "flowinfo",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val portProp =
        {
          name = "port",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val scopeIdProp =
        {
          name = "scope-id",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
    end
  end
