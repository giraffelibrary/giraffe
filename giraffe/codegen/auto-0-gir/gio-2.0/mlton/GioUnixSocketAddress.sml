structure GioUnixSocketAddress :>
  GIO_UNIX_SOCKET_ADDRESS
    where type 'a class = 'a GioUnixSocketAddressClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type unix_socket_address_type_t = GioUnixSocketAddressType.t =
  struct
    val getType_ = _import "g_unix_socket_address_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_unix_socket_address_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
    val newAbstract_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_unix_socket_address_new_abstract" :
              GCharCArrayN.MLton.p1
               * GCharCArrayN.FFI.non_opt GCharCArrayN.MLton.p2
               * GInt.FFI.val_
               -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithType_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_unix_socket_address_new_with_type" :
              GCharCArrayN.MLton.p1
               * GCharCArrayN.FFI.non_opt GCharCArrayN.MLton.p2
               * GInt.FFI.val_
               * GioUnixSocketAddressType.FFI.val_
               -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val abstractNamesSupported_ = _import "g_unix_socket_address_abstract_names_supported" : unit -> GBool.FFI.val_;
    val getAddressType_ = _import "g_unix_socket_address_get_address_type" : GioUnixSocketAddressClass.FFI.non_opt GioUnixSocketAddressClass.FFI.p -> GioUnixSocketAddressType.FFI.val_;
    val getIsAbstract_ = _import "g_unix_socket_address_get_is_abstract" : GioUnixSocketAddressClass.FFI.non_opt GioUnixSocketAddressClass.FFI.p -> GBool.FFI.val_;
    val getPath_ = _import "g_unix_socket_address_get_path" : GioUnixSocketAddressClass.FFI.non_opt GioUnixSocketAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPathLen_ = _import "g_unix_socket_address_get_path_len" : GioUnixSocketAddressClass.FFI.non_opt GioUnixSocketAddressClass.FFI.p -> GSize.FFI.val_;
    type 'a class = 'a GioUnixSocketAddressClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type unix_socket_address_type_t = GioUnixSocketAddressType.t
    type t = base class
    fun asSocketConnectable self = (GObjectObjectClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new path = (Utf8.FFI.withPtr 0 ---> GioUnixSocketAddressClass.FFI.fromPtr true) new_ path
    fun newAbstract path =
      let
        val pathLen = LargeInt.fromInt (GCharCArrayN.length path)
        val retVal = (GCharCArrayN.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GioUnixSocketAddressClass.FFI.fromPtr true) newAbstract_ (path & pathLen)
      in
        retVal
      end
    fun newWithType (path, type') =
      let
        val pathLen = LargeInt.fromInt (GCharCArrayN.length path)
        val retVal =
          (
            GCharCArrayN.FFI.withPtr 0
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
    fun getAddressType self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GioUnixSocketAddressType.FFI.fromVal) getAddressType_ self
    fun getIsAbstract self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsAbstract_ self
    fun getPath self = (GioUnixSocketAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPath_ self
    fun getPathLen self = (GioUnixSocketAddressClass.FFI.withPtr false ---> GSize.FFI.fromVal) getPathLen_ self
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
