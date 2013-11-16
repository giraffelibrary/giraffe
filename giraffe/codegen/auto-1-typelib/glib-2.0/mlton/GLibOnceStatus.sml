structure GLibOnceStatus :>
  sig
    include G_LIB_ONCE_STATUS
  end =
  struct
    datatype t =
      NOTCALLED
    | PROGRESS
    | READY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NOTCALLED => f 0
          | PROGRESS => f 1
          | READY => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NOTCALLED
          | 1 => PROGRESS
          | 2 => READY
          | n => raise Value n
      end
    val null = NOTCALLED
  end
