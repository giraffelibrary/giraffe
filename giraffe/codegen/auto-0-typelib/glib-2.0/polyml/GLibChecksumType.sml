structure GLibChecksumType :>
  sig
    include G_LIB_CHECKSUM_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      MD_5
    | SHA_1
    | SHA_256
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            MD_5 => f 0
          | SHA_1 => f 1
          | SHA_256 => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => MD_5
          | 1 => SHA_1
          | 2 => SHA_256
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = MD_5
  end
