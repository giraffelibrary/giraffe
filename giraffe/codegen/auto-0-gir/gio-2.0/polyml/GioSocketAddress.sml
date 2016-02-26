structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class_t = 'a GioSocketAddressClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type socket_family_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_address_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getFamily_ = call (load_sym libgio "g_socket_address_get_family") (GObjectObjectClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getNativeSize_ = call (load_sym libgio "g_socket_address_get_native_size") (GObjectObjectClass.PolyML.cPtr --> FFI.SSize.PolyML.cVal)
    end
    type 'a class_t = 'a GioSocketAddressClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type socket_family_t = GioSocketFamily.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.SSize.C.fromVal) getNativeSize_ self
    local
      open Property
    in
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
    end
  end
