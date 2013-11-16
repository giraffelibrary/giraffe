structure GLibChecksumType :>
  sig
    include G_LIB_CHECKSUM_TYPE
  end =
  struct
    datatype t =
      MD5
    | SHA1
    | SHA256
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            MD5 => f 0
          | SHA1 => f 1
          | SHA256 => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => MD5
          | 1 => SHA1
          | 2 => SHA256
          | n => raise Value n
      end
    val null = MD5
  end
