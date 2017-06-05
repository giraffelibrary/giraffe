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
        exception Value of GInt32.t
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
      val getType_ = call (load_sym libgio "g_tls_interaction_result_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
