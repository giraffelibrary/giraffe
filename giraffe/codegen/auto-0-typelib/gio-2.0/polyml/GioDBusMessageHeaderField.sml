structure GioDBusMessageHeaderField :> GIO_D_BUS_MESSAGE_HEADER_FIELD =
  struct
    datatype enum =
      INVALID
    | PATH
    | INTERFACE
    | MEMBER
    | ERROR_NAME
    | REPLY_SERIAL
    | DESTINATION
    | SENDER
    | SIGNATURE
    | NUM_UNIX_FDS
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | PATH => 1
          | INTERFACE => 2
          | MEMBER => 3
          | ERROR_NAME => 4
          | REPLY_SERIAL => 5
          | DESTINATION => 6
          | SENDER => 7
          | SIGNATURE => 8
          | NUM_UNIX_FDS => 9
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => PATH
          | 2 => INTERFACE
          | 3 => MEMBER
          | 4 => ERROR_NAME
          | 5 => REPLY_SERIAL
          | 6 => DESTINATION
          | 7 => SENDER
          | 8 => SIGNATURE
          | 9 => NUM_UNIX_FDS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_message_header_field_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
