signature G_LIB_BOOKMARK_FILE_ERROR =
  sig
    datatype enum =
      INVALID_URI
    | INVALID_VALUE
    | APP_NOT_REGISTERED
    | URI_NOT_FOUND
    | READ
    | UNKNOWN_ENCODING
    | WRITE
    | FILE_NOT_FOUND
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
