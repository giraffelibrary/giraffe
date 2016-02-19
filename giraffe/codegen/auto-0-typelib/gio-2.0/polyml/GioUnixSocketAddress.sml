structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class_t = 'a GioUnixSocketAddressClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_socket_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_unix_socket_address_new") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val abstractNamesSupported_ = call (load_sym libgio "g_unix_socket_address_abstract_names_supported") (FFI.PolyML.VOID --> FFI.Bool.PolyML.VAL)
      val getAddressType_ = call (load_sym libgio "g_unix_socket_address_get_address_type") (GObjectObjectClass.PolyML.PTR --> GioUnixSocketAddressType.PolyML.VAL)
      val getPath_ = call (load_sym libgio "g_unix_socket_address_get_path") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getPathLen_ = call (load_sym libgio "g_unix_socket_address_get_path_len") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
    end
    type 'a class_t = 'a GioUnixSocketAddressClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class_t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new path = (Utf8.C.withPtr ---> GioUnixSocketAddressClass.C.fromPtr true) new_ path
    fun abstractNamesSupported () = (I ---> FFI.Bool.C.fromVal) abstractNamesSupported_ ()
    fun getAddressType self = (GObjectObjectClass.C.withPtr ---> GioUnixSocketAddressType.C.fromVal) getAddressType_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPath_ self
    fun getPathLen self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getPathLen_ self
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
