structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class = 'a GioSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_socket_address_get_type" : unit -> GObjectType.FFI.val_;
    val getFamily_ = _import "g_socket_address_get_family" : GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getNativeSize_ = _import "g_socket_address_get_native_size" : GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p -> GInt64.FFI.val_;
    type 'a class = 'a GioSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFamily self = (GioSocketAddressClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getNativeSize self = (GioSocketAddressClass.FFI.withPtr ---> GInt64.FFI.fromVal) getNativeSize_ self
    local
      open Property
    in
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
    end
  end
