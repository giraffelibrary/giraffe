structure GLibNormalizeMode :>
  sig
    include G_LIB_NORMALIZE_MODE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      DEFAULT
    | NFD
    | DEFAULT_COMPOSE
    | NFC
    | ALL
    | NFKD
    | ALL_COMPOSE
    | NFKC
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            DEFAULT => f 0
          | NFD => f 0
          | DEFAULT_COMPOSE => f 1
          | NFC => f 1
          | ALL => f 2
          | NFKD => f 2
          | ALL_COMPOSE => f 3
          | NFKC => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => DEFAULT
          | 0 => NFD
          | 1 => DEFAULT_COMPOSE
          | 1 => NFC
          | 2 => ALL
          | 2 => NFKD
          | 3 => ALL_COMPOSE
          | 3 => NFKC
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = DEFAULT
  end
