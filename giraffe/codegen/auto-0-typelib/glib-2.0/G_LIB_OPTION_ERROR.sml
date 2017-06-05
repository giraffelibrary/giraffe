signature G_LIB_OPTION_ERROR =
  sig
    datatype enum =
      UNKNOWN_OPTION
    | BAD_VALUE
    | FAILED
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
