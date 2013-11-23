structure GIRepositoryDirection :>
  sig
    include G_I_REPOSITORY_DIRECTION
  end =
  struct 
    datatype t =
      IN
    | OUT
    | INOUT
  end
