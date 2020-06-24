structure GioBusType :> GIO_BUS_TYPE =
  struct
    datatype enum =
      STARTER
    | NONE
    | SYSTEM
    | SESSION
    structure Enum =
      Enum(
        type enum = enum
        val null = STARTER
        val toInt =
          fn
            STARTER => ~1
          | NONE => 0
          | SYSTEM => 1
          | SESSION => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            ~1 => STARTER
          | 0 => NONE
          | 1 => SYSTEM
          | 2 => SESSION
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_bus_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
