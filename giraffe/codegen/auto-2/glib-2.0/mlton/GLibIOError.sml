structure GLibIOError :>
  sig
    include G_LIB_I_O_ERROR
  end =
  struct
    datatype t =
      NONE
    | AGAIN
    | INVAL
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | AGAIN => f 1
          | INVAL => f 2
          | UNKNOWN => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => AGAIN
          | 2 => INVAL
          | 3 => UNKNOWN
          | n => raise Value n
      end
    val null = NONE
  end
