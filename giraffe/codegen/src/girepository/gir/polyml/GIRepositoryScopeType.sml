structure GIRepositoryScopeType :> G_I_REPOSITORY_SCOPE_TYPE =
  struct
    datatype enum =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    datatype t = datatype enum
  end
