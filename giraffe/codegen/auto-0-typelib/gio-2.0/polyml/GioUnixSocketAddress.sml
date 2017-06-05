structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_socket_address_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_socket_address_new") (Utf8.PolyML.cInPtr --> GioSocketAddressClass.PolyML.cPtr)
      val newWithType_ =
        call (load_sym libgio "g_unix_socket_address_new_with_type")
          (
            GUInt8CVectorN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GioUnixSocketAddressType.PolyML.cVal
             --> GioSocketAddressClass.PolyML.cPtr
          )
      val abstractNamesSupported_ = call (load_sym libgio "g_unix_socket_address_abstract_names_supported") (PolyMLFFI.cVoid --> GBool.PolyML.cVal)
      val getAddressType_ = call (load_sym libgio "g_unix_socket_address_get_address_type") (GioUnixSocketAddressClass.PolyML.cPtr --> GioUnixSocketAddressType.PolyML.cVal)
      val getPath_ = call (load_sym libgio "g_unix_socket_address_get_path") (GioUnixSocketAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPathLen_ = call (load_sym libgio "g_unix_socket_address_get_path_len") (GioUnixSocketAddressClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
    end
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new path = (Utf8.FFI.withPtr ---> GioUnixSocketAddressClass.FFI.fromPtr true) new_ path
    fun newWithType path type' =
      let
        val pathLen = LargeInt.fromInt (GUInt8CVectorN.length path)
        val retVal =
          (
            GUInt8CVectorN.FFI.withPtr
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
    fun getAddressType self = (GioUnixSocketAddressClass.FFI.withPtr ---> GioUnixSocketAddressType.FFI.fromVal) getAddressType_ self
    fun getPath self = (GioUnixSocketAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPath_ self
    fun getPathLen self = (GioUnixSocketAddressClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getPathLen_ self
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
