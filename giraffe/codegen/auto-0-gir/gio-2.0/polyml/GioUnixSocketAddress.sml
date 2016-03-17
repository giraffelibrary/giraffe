structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_socket_address_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_socket_address_new") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val abstractNamesSupported_ = call (load_sym libgio "g_unix_socket_address_abstract_names_supported") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val getAddressType_ = call (load_sym libgio "g_unix_socket_address_get_address_type") (GObjectObjectClass.PolyML.cPtr --> GioUnixSocketAddressType.PolyML.cVal)
      val getPath_ = call (load_sym libgio "g_unix_socket_address_get_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPathLen_ = call (load_sym libgio "g_unix_socket_address_get_path_len") (GObjectObjectClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
    end
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new path = (Utf8.C.withPtr ---> GioUnixSocketAddressClass.C.fromPtr true) new_ path
    fun abstractNamesSupported () = (I ---> FFI.Bool.C.fromVal) abstractNamesSupported_ ()
    fun getAddressType self = (GObjectObjectClass.C.withPtr ---> GioUnixSocketAddressType.C.fromVal) getAddressType_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPath_ self
    fun getPathLen self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getPathLen_ self
    local
      open Property
    in
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
