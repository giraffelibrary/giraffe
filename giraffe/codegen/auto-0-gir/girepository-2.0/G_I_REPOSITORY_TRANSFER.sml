signature G_I_REPOSITORY_TRANSFER =
  sig
    datatype enum =
      NOTHING
    | CONTAINER
    | EVERYTHING
    include
      ENUM
        where type t = enum
  end
