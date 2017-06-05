structure GLibMarkupError :>
  G_LIB_MARKUP_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      BAD_UTF_8
    | EMPTY
    | PARSE
    | UNKNOWN_ELEMENT
    | UNKNOWN_ATTRIBUTE
    | INVALID_CONTENT
    | MISSING_ATTRIBUTE
    structure Enum =
      Enum(
        type enum = enum
        val null = BAD_UTF_8
        val toInt =
          fn
            BAD_UTF_8 => 0
          | EMPTY => 1
          | PARSE => 2
          | UNKNOWN_ELEMENT => 3
          | UNKNOWN_ATTRIBUTE => 4
          | INVALID_CONTENT => 5
          | MISSING_ATTRIBUTE => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => BAD_UTF_8
          | 1 => EMPTY
          | 2 => PARSE
          | 3 => UNKNOWN_ELEMENT
          | 4 => UNKNOWN_ATTRIBUTE
          | 5 => INVALID_CONTENT
          | 6 => MISSING_ATTRIBUTE
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-markup-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibMarkupError = GLibMarkupError.Error
