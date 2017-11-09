structure GioPasswordSave :> GIO_PASSWORD_SAVE =
  struct
    datatype enum =
      NEVER
    | FOR_SESSION
    | PERMANENTLY
    structure Enum =
      Enum(
        type enum = enum
        val null = NEVER
        val toInt =
          fn
            NEVER => 0
          | FOR_SESSION => 1
          | PERMANENTLY => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEVER
          | 1 => FOR_SESSION
          | 2 => PERMANENTLY
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_password_save_get_type" : unit -> GObjectType.FFI.val_;
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
