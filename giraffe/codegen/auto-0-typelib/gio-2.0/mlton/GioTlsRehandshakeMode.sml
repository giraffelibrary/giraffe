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
    val getType_ = _import "g_tls_rehandshake_mode_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
