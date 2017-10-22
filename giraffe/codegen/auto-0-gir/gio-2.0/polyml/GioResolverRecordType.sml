structure GioResolverRecordType :> GIO_RESOLVER_RECORD_TYPE =
  struct
    datatype enum =
      SRV
    | MX
    | TXT
    | SOA
    | NS
    structure Enum =
      Enum(
        type enum = enum
        val null = SRV
        val toInt =
          fn
            SRV => 1
          | MX => 2
          | TXT => 3
          | SOA => 4
          | NS => 5
        exception Value of GInt.t
        val fromInt =
          fn
            1 => SRV
          | 2 => MX
          | 3 => TXT
          | 4 => SOA
          | 5 => NS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_resolver_record_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
