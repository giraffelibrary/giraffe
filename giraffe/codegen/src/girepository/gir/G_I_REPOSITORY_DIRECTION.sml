signature G_I_REPOSITORY_DIRECTION =
  sig
    datatype enum =
      IN
    | OUT
    | INOUT
    type t = enum
  end
