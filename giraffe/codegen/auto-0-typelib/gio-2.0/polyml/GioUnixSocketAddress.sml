structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_socket_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_socket_address_new") (Utf8.PolyML.cInPtr --> GioSocketAddressClass.PolyML.cPtr)
      val newAbstract_ = call (getSymbol "g_unix_socket_address_new_abstract") (GInt8CArrayN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GioSocketAddressClass.PolyML.cPtr)
      val newWithType_ =
        call (getSymbol "g_unix_socket_address_new_with_type")
          (
            GInt8CArrayN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GioUnixSocketAddressType.PolyML.cVal
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val abstractNamesSupported_ = call (getSymbol "g_unix_socket_address_abstract_names_supported") (cVoid --> GBool.PolyML.cVal)
      val getAddressType_ = call (getSymbol "g_unix_socket_address_get_address_type") (GioUnixSocketAddressClass.PolyML.cPtr --> GioUnixSocketAddressType.PolyML.cVal)
      val getIsAbstract_ = call (getSymbol "g_unix_socket_address_get_is_abstract") (GioUnixSocketAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPath_ = call (getSymbol "g_unix_socket_address_get_path") (GioUnixSocketAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPathLen_ = call (getSymbol "g_unix_socket_address_get_path_len") (GioUnixSocketAddressClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
    end
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new path = (Utf8.FFI.withPtr 0 ---> GioUnixSocketAddressClass.FFI.fromPtr true) new_ path
    fun newAbstract path =
      let
        val pathLen = LargeInt.fromInt (GInt8CArrayN.length path)
        val retVal = (GInt8CArrayN.FFI.withPtr 0 &&&> GInt32.FFI.withVal ---> GioUnixSocketAddressClass.FFI.fromPtr true) newAbstract_ (path & pathLen)
      in
        retVal
      end
    fun newWithType (path, type') =
      let
        val pathLen = LargeInt.fromInt (GInt8CArrayN.length path)
        val retVal =
          (
            GInt8CArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> GioUnixSocketAddressType.FFI.withVal
             ---> GioUnixSocketAddressClass.FFI.fromPtr true
          )
            newWithType_
            (
              path
               & pathLen
               & type'
            )
      in
        retVal
      end
    fun abstractNamesSupported () = (I ---> GBool.FFI.fromVal) abstractNamesSupported_ ()
    fun getAddressType self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GioUnixSocketAddressType.FFI.fromVal) getAddressType_ self
    fun getIsAbstract self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsAbstract_ self
    fun getPath self = (GioUnixSocketAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPath_ self before GioUnixSocketAddressClass.FFI.touchPtr self
    fun getPathLen self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getPathLen_ self
    local
      open ValueAccessor
    in
      val abstractProp =
        {
          name = "abstract",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val addressTypeProp =
        {
          name = "address-type",
          gtype = fn () => C.gtype GioUnixSocketAddressType.t (),
          get = fn x => fn () => C.get GioUnixSocketAddressType.t x,
          set = ignore,
          init = fn x => C.set GioUnixSocketAddressType.t x
        }
      val pathProp =
        {
          name = "path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
