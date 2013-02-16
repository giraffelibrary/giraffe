structure GIRepositoryFieldInfoFlags :>
  sig
    include G_I_REPOSITORY_FIELD_INFO_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val allFlags = [READABLE, WRITABLE]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Flags.VAL
        val REF = FFI.PolyML.Flags.REF
      end
  end
