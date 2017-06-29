structure GioBusType :> GIO_BUS_TYPE =
  struct
    datatype enum =
      STARTER
    | NONE
    | SYSTEM
    | SESSION
    structure Enum =
      Enum(
        type enum = enum
        val null = STARTER
        val toInt =
          fn
            STARTER => ~1
          | NONE => 0
          | SYSTEM => 1
          | SESSION => 2
        exception Value of GInt.t
        val fromInt =
          fn
            ~1 => STARTER
          | 0 => NONE
          | 1 => SYSTEM
          | 2 => SESSION
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_bus_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
