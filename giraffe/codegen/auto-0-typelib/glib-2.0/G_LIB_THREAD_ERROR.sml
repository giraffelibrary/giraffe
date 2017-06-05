signature G_LIB_THREAD_ERROR =
  sig
    datatype enum =
      THREAD_ERROR_AGAIN
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
