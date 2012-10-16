structure GLibNormalizeMode :>
  sig
    include G_LIB_NORMALIZE_MODE
  end =
  struct
    datatype t =
      DEFAULT
    | NFD
    | DEFAULTCOMPOSE
    | NFC
    | ALL
    | NFKD
    | ALLCOMPOSE
    | NFKC
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            DEFAULT => f 0
          | NFD => f 0
          | DEFAULTCOMPOSE => f 1
          | NFC => f 1
          | ALL => f 2
          | NFKD => f 2
          | ALLCOMPOSE => f 3
          | NFKC => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => DEFAULT
          | 0 => NFD
          | 1 => DEFAULTCOMPOSE
          | 1 => NFC
          | 2 => ALL
          | 2 => NFKD
          | 3 => ALLCOMPOSE
          | 3 => NFKC
          | n => raise Value n
      end
    val null = DEFAULT
  end
