signature G_I_REPOSITORY_ARRAY_TYPE =
  sig
    datatype enum =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    include
      ENUM
        where type t = enum
  end
