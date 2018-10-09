signature G_LIB_I_O_CHANNEL_ERROR =
  sig
    datatype enum =
      FBIG
    | INVAL
    | IO
    | ISDIR
    | NOSPC
    | NXIO
    | OVERFLOW
    | PIPE
    | FAILED
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
