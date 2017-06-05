structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class = 'a GioSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_address_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFamily_ = call (load_sym libgio "g_socket_address_get_family") (GioSocketAddressClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getNativeSize_ = call (load_sym libgio "g_socket_address_get_native_size") (GioSocketAddressClass.PolyML.cPtr --> GSSize.PolyML.cVal)
    end
    type 'a class = 'a GioSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFamily self = (GioSocketAddressClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getNativeSize self = (GioSocketAddressClass.FFI.withPtr ---> GSSize.FFI.fromVal) getNativeSize_ self
    local
      open Property
    in
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
    end
  end
