structure GIRepositoryTransfer :>
  sig
    include G_I_REPOSITORY_TRANSFER
  end =
  struct
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NOTHING => f 0
          | CONTAINER => f 1
          | EVERYTHING => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NOTHING
          | 1 => CONTAINER
          | 2 => EVERYTHING
          | n => raise Value n
      end
    val null = NOTHING
  end