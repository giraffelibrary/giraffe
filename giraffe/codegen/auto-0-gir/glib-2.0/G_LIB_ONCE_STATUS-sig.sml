signature G_LIB_ONCE_STATUS =
  sig
    datatype enum =
      NOTCALLED
    | PROGRESS
    | READY
    include
      ENUM
        where type t = enum
  end
