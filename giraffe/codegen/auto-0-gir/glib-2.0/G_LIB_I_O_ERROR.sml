signature G_LIB_I_O_ERROR =
  sig
    datatype enum =
      NONE
    | AGAIN
    | INVAL
    | UNKNOWN
    include
      ENUM
        where type t = enum
  end
