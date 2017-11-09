structure GioTlsError :> GIO_TLS_ERROR =
  struct
    datatype enum =
      UNAVAILABLE
    | MISC
    | BAD_CERTIFICATE
    | NOT_TLS
    | HANDSHAKE
    | CERTIFICATE_REQUIRED
    | EOF
    structure Enum =
      Enum(
        type enum = enum
        val null = UNAVAILABLE
        val toInt =
          fn
            UNAVAILABLE => 0
          | MISC => 1
          | BAD_CERTIFICATE => 2
          | NOT_TLS => 3
          | HANDSHAKE => 4
          | CERTIFICATE_REQUIRED => 5
          | EOF => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNAVAILABLE
          | 1 => MISC
          | 2 => BAD_CERTIFICATE
          | 3 => NOT_TLS
          | 4 => HANDSHAKE
          | 5 => CERTIFICATE_REQUIRED
          | 6 => EOF
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-tls-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GioTlsError = GioTlsError.Error
