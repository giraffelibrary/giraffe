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
    val getType_ = _import "vte_regex_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
