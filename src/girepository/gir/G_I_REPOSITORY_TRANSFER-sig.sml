signature G_I_REPOSITORY_TRANSFER =
  sig
    datatype enum =
      NOTHING
    | CONTAINER
    | EVERYTHING
    type t = enum
  end
