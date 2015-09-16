structure GLibTraverseFlags :>
  sig
    include G_LIB_TRAVERSE_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val LEAVES = 0w1
    val NON_LEAVES = 0w2
    val ALL = 0w3
    val MASK = 0w3
    val LEAFS = 0w1
    val NON_LEAFS = 0w2
    val allFlags =
      [
        LEAVES,
        NON_LEAVES,
        ALL,
        MASK,
        LEAFS,
        NON_LEAFS
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
