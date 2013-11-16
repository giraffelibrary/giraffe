structure GLibIOStatus :>
  sig
    include G_LIB_I_O_STATUS
  end =
  struct
    datatype t =
      ERROR
    | NORMAL
    | EOF
    | AGAIN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ERROR => f 0
          | NORMAL => f 1
          | EOF => f 2
          | AGAIN => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => ERROR
          | 1 => NORMAL
          | 2 => EOF
          | 3 => AGAIN
          | n => raise Value n
      end
    val null = ERROR
  end
