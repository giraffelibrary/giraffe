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
    val getType_ = _import "g_resolver_record_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
