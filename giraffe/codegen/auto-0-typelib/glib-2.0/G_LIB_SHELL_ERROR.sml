signature G_LIB_SHELL_ERROR =
  sig
    datatype enum =
      BAD_QUOTING
    | EMPTY_STRING
    | FAILED
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
