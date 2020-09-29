structure GIRepositoryDirection :> G_I_REPOSITORY_DIRECTION =
  struct
    datatype enum =
      IN
    | OUT
    | INOUT
    datatype t = datatype enum
  end
