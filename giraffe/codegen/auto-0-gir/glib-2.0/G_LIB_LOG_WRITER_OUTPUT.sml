signature G_LIB_LOG_WRITER_OUTPUT =
  sig
    datatype enum =
      HANDLED
    | UNHANDLED
    include
      ENUM
        where type t = enum
  end
