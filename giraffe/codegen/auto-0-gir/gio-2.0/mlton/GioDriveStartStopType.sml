structure GioDriveStartStopType :> GIO_DRIVE_START_STOP_TYPE =
  struct
    datatype enum =
      UNKNOWN
    | SHUTDOWN
    | NETWORK
    | MULTIDISK
    | PASSWORD
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | SHUTDOWN => 1
          | NETWORK => 2
          | MULTIDISK => 3
          | PASSWORD => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => SHUTDOWN
          | 2 => NETWORK
          | 3 => MULTIDISK
          | 4 => PASSWORD
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_drive_start_stop_type_get_type" : unit -> GObjectType.FFI.val_;
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
