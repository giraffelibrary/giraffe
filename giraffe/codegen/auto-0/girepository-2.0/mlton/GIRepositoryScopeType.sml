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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | CALL => f 1
          | ASYNC => f 2
          | NOTIFIED => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => CALL
          | 2 => ASYNC
          | 3 => NOTIFIED
          | n => raise Value n
      end
    val null = INVALID
  end
