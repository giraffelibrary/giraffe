signature G_LIB_MARKUP_ERROR =
  sig
    datatype enum =
      BAD_UTF_8
    | EMPTY
    | PARSE
    | UNKNOWN_ELEMENT
    | UNKNOWN_ATTRIBUTE
    | INVALID_CONTENT
    | MISSING_ATTRIBUTE
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
