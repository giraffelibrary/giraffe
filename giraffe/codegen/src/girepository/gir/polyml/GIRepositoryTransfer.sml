structure GIRepositoryTransfer :>
  sig
    include G_I_REPOSITORY_TRANSFER
  end =
  struct 
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
  end
