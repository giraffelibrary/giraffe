signature G_LIB_KEY_FILE_ERROR =
  sig
    datatype enum =
      UNKNOWN_ENCODING
    | PARSE
    | NOT_FOUND
    | KEY_NOT_FOUND
    | GROUP_NOT_FOUND
    | INVALID_VALUE
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
