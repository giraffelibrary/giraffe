structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    val getType_ = _import "g_unix_socket_address_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_unix_socket_address_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;
    val abstractNamesSupported_ = _import "g_unix_socket_address_abstract_names_supported" : unit -> FFI.Bool.C.val_;
    val getAddressType_ = _import "g_unix_socket_address_get_address_type" : GioUnixSocketAddressClass.C.notnull GioUnixSocketAddressClass.C.p -> GioUnixSocketAddressType.C.val_;
    val getPath_ = _import "g_unix_socket_address_get_path" : GioUnixSocketAddressClass.C.notnull GioUnixSocketAddressClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPathLen_ = _import "g_unix_socket_address_get_path_len" : GioUnixSocketAddressClass.C.notnull GioUnixSocketAddressClass.C.p -> FFI.UInt64.C.val_;
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new path = (Utf8.C.withPtr ---> GioUnixSocketAddressClass.C.fromPtr true) new_ path
    fun abstractNamesSupported () = (I ---> FFI.Bool.C.fromVal) abstractNamesSupported_ ()
    fun getAddressType self = (GioUnixSocketAddressClass.C.withPtr ---> GioUnixSocketAddressType.C.fromVal) getAddressType_ self
    fun getPath self = (GioUnixSocketAddressClass.C.withPtr ---> Utf8.C.fromPtr false) getPath_ self
    fun getPathLen self = (GioUnixSocketAddressClass.C.withPtr ---> FFI.UInt64.C.fromVal) getPathLen_ self
    local
      open Property
    in
      val abstractProp =
        {
          get = fn x => get "abstract" boolean x,
          set = fn x => set "abstract" boolean x
        }
      val addressTypeProp =
        {
          get = fn x => get "address-type" GioUnixSocketAddressType.t x,
          set = fn x => set "address-type" GioUnixSocketAddressType.t x
        }
      val pathProp =
        {
          get = fn x => get "path" stringOpt x,
          set = fn x => set "path" stringOpt x
        }
    end
  end
