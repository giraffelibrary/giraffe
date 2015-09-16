signature G_LIB_NORMALIZE_MODE =
  sig
    datatype t =
      DEFAULT
    | NFD
    | DEFAULT_COMPOSE
    | NFC
    | ALL
    | NFKD
    | ALL_COMPOSE
    | NFKC
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
