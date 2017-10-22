signature G_LIB_CONVERT_ERROR =
  sig
    datatype enum =
      NO_CONVERSION
    | ILLEGAL_SEQUENCE
    | FAILED
    | PARTIAL_INPUT
    | BAD_URI
    | NOT_ABSOLUTE_PATH
    | NO_MEMORY
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
