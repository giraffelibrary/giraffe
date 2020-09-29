structure GIRepositoryTransfer :> G_I_REPOSITORY_TRANSFER =
  struct
    datatype enum =
      NOTHING
    | CONTAINER
    | EVERYTHING
    datatype t = datatype enum
  end
