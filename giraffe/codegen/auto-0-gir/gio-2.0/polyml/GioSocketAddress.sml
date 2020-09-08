structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class = 'a GioSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFamily_ = call (getSymbol "g_socket_address_get_family") (GioSocketAddressClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getNativeSize_ = call (getSymbol "g_socket_address_get_native_size") (GioSocketAddressClass.PolyML.cPtr --> GSSize.PolyML.cVal)
    end
    type 'a class = 'a GioSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFamily self = (GioSocketAddressClass.FFI.withPtr false ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getNativeSize self = (GioSocketAddressClass.FFI.withPtr false ---> GSSize.FFI.fromVal) getNativeSize_ self
    local
      open ValueAccessor
    in
      val familyProp =
        {
          name = "family",
          gtype = fn () => C.gtype GioSocketFamily.t (),
          get = fn x => fn () => C.get GioSocketFamily.t x,
          set = ignore,
          init = ignore
        }
    end
  end
