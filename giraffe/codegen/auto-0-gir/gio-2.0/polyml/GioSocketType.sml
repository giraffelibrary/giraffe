structure GioSocketType :> GIO_SOCKET_TYPE =
  struct
    datatype enum =
      INVALID
    | STREAM
    | DATAGRAM
    | SEQPACKET
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | STREAM => 1
          | DATAGRAM => 2
          | SEQPACKET => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => STREAM
          | 2 => DATAGRAM
          | 3 => SEQPACKET
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
