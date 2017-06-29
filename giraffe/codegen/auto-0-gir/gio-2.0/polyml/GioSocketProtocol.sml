structure GioSocketProtocol :> GIO_SOCKET_PROTOCOL =
  struct
    datatype enum =
      UNKNOWN
    | DEFAULT
    | TCP
    | UDP
    | SCTP
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => ~1
          | DEFAULT => 0
          | TCP => 6
          | UDP => 17
          | SCTP => 132
        exception Value of GInt.t
        val fromInt =
          fn
            ~1 => UNKNOWN
          | 0 => DEFAULT
          | 6 => TCP
          | 17 => UDP
          | 132 => SCTP
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_protocol_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
