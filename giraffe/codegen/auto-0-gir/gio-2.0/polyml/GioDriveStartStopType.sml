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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_drive_start_stop_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
