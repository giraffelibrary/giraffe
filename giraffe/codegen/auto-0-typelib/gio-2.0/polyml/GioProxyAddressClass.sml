structure GioProxyAddressClass :>
  GIO_PROXY_ADDRESS_CLASS
    where type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    where type C.notnull = GioInetSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioInetSocketAddressClass.C.p =
  struct
    type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    open GioInetSocketAddressClass
    type 'a proxy_address = unit
    type 'a class = 'a proxy_address class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
