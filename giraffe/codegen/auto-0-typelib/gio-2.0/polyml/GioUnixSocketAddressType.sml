structure GioUnixSocketAddressType :> GIO_UNIX_SOCKET_ADDRESS_TYPE =
  struct
    datatype enum =
      INVALID
    | ANONYMOUS
    | PATH
    | ABSTRACT
    | ABSTRACT_PADDED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | ANONYMOUS => 1
          | PATH => 2
          | ABSTRACT => 3
          | ABSTRACT_PADDED => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => ANONYMOUS
          | 2 => PATH
          | 3 => ABSTRACT
          | 4 => ABSTRACT_PADDED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_socket_address_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
