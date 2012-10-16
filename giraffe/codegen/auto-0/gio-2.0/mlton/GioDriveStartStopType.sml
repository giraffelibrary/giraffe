structure GioDriveStartStopType :>
  sig
    include GIO_DRIVE_START_STOP_TYPE
  end =
  struct
    datatype t =
      UNKNOWN
    | SHUTDOWN
    | NETWORK
    | MULTIDISK
    | PASSWORD
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | SHUTDOWN => f 1
          | NETWORK => f 2
          | MULTIDISK => f 3
          | PASSWORD => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => SHUTDOWN
          | 2 => NETWORK
          | 3 => MULTIDISK
          | 4 => PASSWORD
          | n => raise Value n
      end
    val getType_ = _import "g_drive_start_stop_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = UNKNOWN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
