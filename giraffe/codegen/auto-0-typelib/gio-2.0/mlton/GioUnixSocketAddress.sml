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
    val getType_ = _import "g_unix_socket_address_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_unix_socket_address_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;
    val newWithType_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_unix_socket_address_new_with_type" :
              GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GInt32.FFI.val_
               * GioUnixSocketAddressType.FFI.val_
               -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val abstractNamesSupported_ = _import "g_unix_socket_address_abstract_names_supported" : unit -> GBool.FFI.val_;
    val getAddressType_ = _import "g_unix_socket_address_get_address_type" : GioUnixSocketAddressClass.FFI.notnull GioUnixSocketAddressClass.FFI.p -> GioUnixSocketAddressType.FFI.val_;
    val getPath_ = _import "g_unix_socket_address_get_path" : GioUnixSocketAddressClass.FFI.notnull GioUnixSocketAddressClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPathLen_ = _import "g_unix_socket_address_get_path_len" : GioUnixSocketAddressClass.FFI.notnull GioUnixSocketAddressClass.FFI.p -> GUInt64.FFI.val_;
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new path = (Utf8.FFI.withPtr ---> GioUnixSocketAddressClass.FFI.fromPtr true) new_ path
    fun newWithType (path, type') =
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
