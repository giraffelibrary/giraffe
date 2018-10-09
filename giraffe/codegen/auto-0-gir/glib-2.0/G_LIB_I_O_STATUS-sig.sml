signature G_LIB_I_O_STATUS =
  sig
    datatype enum =
      ERROR
    | NORMAL
    | EOF
    | AGAIN
    include
      ENUM
        where type t = enum
  end
