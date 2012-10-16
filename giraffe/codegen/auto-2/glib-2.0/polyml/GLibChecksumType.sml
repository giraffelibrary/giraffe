structure GLibChecksumType :>
  sig
    include G_LIB_CHECKSUM_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      MD5
    | SHA1
    | SHA256
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            MD5 => f 0
          | SHA1 => f 1
          | SHA256 => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => MD5
          | 1 => SHA1
          | 2 => SHA256
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = MD5
  end
