structure GioSettingsBindFlags :> GIO_SETTINGS_BIND_FLAGS =
  struct
    val DEFAULT = 0w0
    val GET = 0w1
    val SET = 0w2
    val NO_SENSITIVITY = 0w4
    val GET_NO_CHANGES = 0w8
    val INVERT_BOOLEAN = 0w16
    val allFlags =
      [
        DEFAULT,
        GET,
        SET,
        NO_SENSITIVITY,
        GET_NO_CHANGES,
        INVERT_BOOLEAN
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_bind_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
