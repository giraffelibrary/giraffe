structure GioProxyAddressEnumeratorClass :>
  GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    where type C.opt = GioSocketAddressEnumeratorClass.C.opt
    where type C.non_opt = GioSocketAddressEnumeratorClass.C.non_opt
    where type 'a C.p = 'a GioSocketAddressEnumeratorClass.C.p =
  struct
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    open GioSocketAddressEnumeratorClass
    type 'a proxy_address_enumerator = unit
    type 'a class = 'a proxy_address_enumerator class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_address_enumerator_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
