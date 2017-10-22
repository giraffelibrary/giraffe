signature G_I_REPOSITORY_NVOKE_ERROR =
  sig
    datatype enum =
      FAILED
    | SYMBOL_NOT_FOUND
    | ARGUMENT_MISMATCH
    include
      ENUM
        where type t = enum
  end
