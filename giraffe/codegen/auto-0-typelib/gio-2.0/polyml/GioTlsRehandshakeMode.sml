structure GioTlsRehandshakeMode :> GIO_TLS_REHANDSHAKE_MODE =
  struct
    datatype enum =
      NEVER
    | SAFELY
    | UNSAFELY
    structure Enum =
      Enum(
        type enum = enum
        val null = NEVER
        val toInt =
          fn
            NEVER => 0
          | SAFELY => 1
          | UNSAFELY => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NEVER
          | 1 => SAFELY
          | 2 => UNSAFELY
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_rehandshake_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
