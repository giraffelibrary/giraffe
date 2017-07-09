structure GioResolverError :> GIO_RESOLVER_ERROR =
  struct
    datatype enum =
      NOT_FOUND
    | TEMPORARY_FAILURE
    | INTERNAL
    structure Enum =
      Enum(
        type enum = enum
        val null = NOT_FOUND
        val toInt =
          fn
            NOT_FOUND => 0
          | TEMPORARY_FAILURE => 1
          | INTERNAL => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NOT_FOUND
          | 1 => TEMPORARY_FAILURE
          | 2 => INTERNAL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_resolver_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-resolver-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GioResolverError = GioResolverError.Error
