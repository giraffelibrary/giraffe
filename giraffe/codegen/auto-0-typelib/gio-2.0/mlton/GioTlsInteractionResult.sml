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
    val getType_ = _import "g_tls_interaction_result_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
