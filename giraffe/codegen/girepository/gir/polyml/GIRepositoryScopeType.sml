structure GIRepositoryScopeType :>
  sig
    include G_I_REPOSITORY_SCOPE_TYPE
  end =
  struct 
    datatype t =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
  end
