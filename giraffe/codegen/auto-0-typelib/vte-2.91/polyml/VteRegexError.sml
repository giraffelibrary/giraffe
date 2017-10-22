structure VteRegexError :> VTE_REGEX_ERROR =
  struct
    datatype enum =
      INCOMPATIBLE
    | NOT_SUPPORTED
    structure Enum =
      Enum(
        type enum = enum
        val null = INCOMPATIBLE
        val toInt =
          fn
            INCOMPATIBLE => 2147483646
          | NOT_SUPPORTED => 2147483647
        exception Value of GInt32.t
        val fromInt =
          fn
            2147483646 => INCOMPATIBLE
          | 2147483647 => NOT_SUPPORTED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_regex_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "vte-regex-error",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception VteRegexError = VteRegexError.Error
