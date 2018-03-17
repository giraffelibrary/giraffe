structure GioUnixConnectionClass :>
  GIO_UNIX_CONNECTION_CLASS
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    open GioSocketConnectionClass
    type 'a unix_connection = unit
    type 'a class = 'a unix_connection class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
