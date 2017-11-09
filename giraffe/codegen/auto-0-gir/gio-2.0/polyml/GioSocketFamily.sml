structure GioSocketFamily :> GIO_SOCKET_FAMILY =
  struct
    datatype enum =
      INVALID
    | UNIX
    | IPV_4
    | IPV_6
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | UNIX => 1
          | IPV_4 => 2
          | IPV_6 => 10
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => UNIX
          | 2 => IPV_4
          | 10 => IPV_6
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_family_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
