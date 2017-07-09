structure GioDBusMessageType :> GIO_D_BUS_MESSAGE_TYPE =
  struct
    datatype enum =
      INVALID
    | METHOD_CALL
    | METHOD_RETURN
    | ERROR
    | SIGNAL
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | METHOD_CALL => 1
          | METHOD_RETURN => 2
          | ERROR => 3
          | SIGNAL => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => METHOD_CALL
          | 2 => METHOD_RETURN
          | 3 => ERROR
          | 4 => SIGNAL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_message_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
