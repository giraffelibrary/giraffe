structure GIRepositoryArrayType :> G_I_REPOSITORY_ARRAY_TYPE =
  struct
    datatype enum =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    datatype t = datatype enum
  end
