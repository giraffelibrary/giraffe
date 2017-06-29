structure GioFileMonitorEvent :> GIO_FILE_MONITOR_EVENT =
  struct
    datatype enum =
      CHANGED
    | CHANGES_DONE_HINT
    | DELETED
    | CREATED
    | ATTRIBUTE_CHANGED
    | PRE_UNMOUNT
    | UNMOUNTED
    | MOVED
    structure Enum =
      Enum(
        type enum = enum
        val null = CHANGED
        val toInt =
          fn
            CHANGED => 0
          | CHANGES_DONE_HINT => 1
          | DELETED => 2
          | CREATED => 3
          | ATTRIBUTE_CHANGED => 4
          | PRE_UNMOUNT => 5
          | UNMOUNTED => 6
          | MOVED => 7
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CHANGED
          | 1 => CHANGES_DONE_HINT
          | 2 => DELETED
          | 3 => CREATED
          | 4 => ATTRIBUTE_CHANGED
          | 5 => PRE_UNMOUNT
          | 6 => UNMOUNTED
          | 7 => MOVED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_monitor_event_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
