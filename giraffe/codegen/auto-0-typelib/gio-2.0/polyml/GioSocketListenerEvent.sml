structure GioSocketListenerEvent :> GIO_SOCKET_LISTENER_EVENT =
  struct
    datatype enum =
      BINDING
    | BOUND
    | LISTENING
    | LISTENED
    structure Enum =
      Enum(
        type enum = enum
        val null = BINDING
        val toInt =
          fn
            BINDING => 0
          | BOUND => 1
          | LISTENING => 2
          | LISTENED => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BINDING
          | 1 => BOUND
          | 2 => LISTENING
          | 3 => LISTENED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_listener_event_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
