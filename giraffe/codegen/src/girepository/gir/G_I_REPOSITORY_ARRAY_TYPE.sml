signature G_I_REPOSITORY_ARRAY_TYPE =
  sig
    datatype enum =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    type t = enum
  end
