structure VtePtyError :> VTE_PTY_ERROR =
  struct
    datatype enum =
      PTY_HELPER_FAILED
    | PTY_98_FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = PTY_HELPER_FAILED
        val toInt =
          fn
            PTY_HELPER_FAILED => 0
          | PTY_98_FAILED => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PTY_HELPER_FAILED
          | 1 => PTY_98_FAILED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "vte_pty_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
          "vte-pty-error",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception VtePtyError = VtePtyError.Error
