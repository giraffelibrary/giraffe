structure GioUnixSocketAddressClass :>
  GIO_UNIX_SOCKET_ADDRESS_CLASS
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type C.notnull = GioSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressClass.C.p =
  struct
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    open GioSocketAddressClass
    type 'a unix_socket_address = unit
    type 'a class = 'a unix_socket_address class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_socket_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
