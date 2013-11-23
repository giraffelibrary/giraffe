structure GLibNormalizeMode :>
  sig
    include G_LIB_NORMALIZE_MODE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = DEFAULT
  end
