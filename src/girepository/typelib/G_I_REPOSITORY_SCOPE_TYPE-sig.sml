signature G_I_REPOSITORY_SCOPE_TYPE =
  sig
    datatype enum =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    include
      ENUM
        where type t = enum
  end
