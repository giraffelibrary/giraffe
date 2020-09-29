signature G_I_REPOSITORY_DIRECTION =
  sig
    datatype enum =
      IN
    | OUT
    | INOUT
    include
      ENUM
        where type t = enum
  end
