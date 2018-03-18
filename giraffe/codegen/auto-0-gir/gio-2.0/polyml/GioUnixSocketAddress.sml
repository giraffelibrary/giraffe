structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    structure GCharCVectorNType =
      CValueCVectorNType(
        structure CElemType = GCharType
        structure ElemSequence = MonoVectorSequence(CharVector)
      )
    structure GCharCVectorN = CVectorN(GCharCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_socket_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_socket_address_new") (Utf8.PolyML.cInPtr --> GioSocketAddressClass.PolyML.cPtr)
      val newAbstract_ = call (getSymbol "g_unix_socket_address_new_abstract") (GCharCVectorN.PolyML.cInPtr &&> GInt.PolyML.cVal --> GioSocketAddressClass.PolyML.cPtr)
      val newWithType_ =
        call (getSymbol "g_unix_socket_address_new_with_type")
          (
            GCharCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GioUnixSocketAddressType.PolyML.cVal
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val abstractNamesSupported_ = call (getSymbol "g_unix_socket_address_abstract_names_supported") (cVoid --> GBool.PolyML.cVal)
      val getAddressType_ = call (getSymbol "g_unix_socket_address_get_address_type") (GioUnixSocketAddressClass.PolyML.cPtr --> GioUnixSocketAddressType.PolyML.cVal)
      val getIsAbstract_ = call (getSymbol "g_unix_socket_address_get_is_abstract") (GioUnixSocketAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPath_ = call (getSymbol "g_unix_socket_address_get_path") (GioUnixSocketAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPathLen_ = call (getSymbol "g_unix_socket_address_get_path_len") (GioUnixSocketAddressClass.PolyML.cPtr --> GSize.PolyML.cVal)
    end
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new path = (Utf8.FFI.withPtr ---> GioUnixSocketAddressClass.FFI.fromPtr true) new_ path
    fun newAbstract path =
      let
        val pathLen = LargeInt.fromInt (GCharCVectorN.length path)
        val retVal = (GCharCVectorN.FFI.withPtr &&&> GInt.FFI.withVal ---> GioUnixSocketAddressClass.FFI.fromPtr true) newAbstract_ (path & pathLen)
      in
        retVal
      end
    fun newWithType (path, type') =
      let
        val pathLen = LargeInt.fromInt (GCharCVectorN.length path)
        val retVal =
          (
            GCharCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
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
    fun getAddressType self = (GioUnixSocketAddressClass.FFI.withPtr ---> GioUnixSocketAddressType.FFI.fromVal) getAddressType_ self
    fun getIsAbstract self = (GioUnixSocketAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsAbstract_ self
    fun getPath self = (GioUnixSocketAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPath_ self
    fun getPathLen self = (GioUnixSocketAddressClass.FFI.withPtr ---> GSize.FFI.fromVal) getPathLen_ self
    local
      open Property
    in
      val abstractProp =
        {
          get = fn x => get "abstract" boolean x,
          new = fn x => new "abstract" boolean x
        }
      val addressTypeProp =
        {
          get = fn x => get "address-type" GioUnixSocketAddressType.t x,
          new = fn x => new "address-type" GioUnixSocketAddressType.t x
        }
      val pathProp =
        {
          get = fn x => get "path" stringOpt x,
          new = fn x => new "path" stringOpt x
        }
    end
  end
