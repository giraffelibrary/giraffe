structure GLibSeekType :>
  sig
    include G_LIB_SEEK_TYPE
  end =
  struct
    datatype t =
      CUR
    | SET
    | END
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CUR => f 0
          | SET => f 1
          | END => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CUR
          | 1 => SET
          | 2 => END
          | n => raise Value n
      end
    val null = CUR
  end
