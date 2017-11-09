structure GioTlsInteractionResult :> GIO_TLS_INTERACTION_RESULT =
  struct
    datatype enum =
      UNHANDLED
    | HANDLED
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = UNHANDLED
        val toInt =
          fn
            UNHANDLED => 0
          | HANDLED => 1
          | FAILED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNHANDLED
          | 1 => HANDLED
          | 2 => FAILED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_interaction_result_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
