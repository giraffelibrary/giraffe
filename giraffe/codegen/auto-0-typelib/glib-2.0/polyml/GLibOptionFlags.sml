structure GLibOptionFlags :>
  sig
    include G_LIB_OPTION_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val HIDDEN = 0w1
    val IN_MAIN = 0w2
    val REVERSE = 0w4
    val NO_ARG = 0w8
    val FILENAME = 0w16
    val OPTIONAL_ARG = 0w32
    val NOALIAS = 0w64
    val allFlags =
      [
        HIDDEN,
        IN_MAIN,
        REVERSE,
        NO_ARG,
        FILENAME,
        OPTIONAL_ARG,
        NOALIAS
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
  end
