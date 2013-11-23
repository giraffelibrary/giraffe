structure GIRepositoryArrayType :>
  sig
    include G_I_REPOSITORY_ARRAY_TYPE
  end =
  struct
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
  end
