structure GioDBusProxyFlags :> GIO_D_BUS_PROXY_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val DO_NOT_LOAD_PROPERTIES = 0w1
    val DO_NOT_CONNECT_SIGNALS = 0w2
    val DO_NOT_AUTO_START = 0w4
    val allFlags =
      [
        NONE,
        DO_NOT_LOAD_PROPERTIES,
        DO_NOT_CONNECT_SIGNALS,
        DO_NOT_AUTO_START
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_proxy_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
