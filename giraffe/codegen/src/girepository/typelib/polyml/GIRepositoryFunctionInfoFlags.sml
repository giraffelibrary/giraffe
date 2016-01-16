structure GIRepositoryFunctionInfoFlags :>
  sig
    include G_I_REPOSITORY_FUNCTION_INFO_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val ISMETHOD = 0w1
    val ISCONSTRUCTOR = 0w2
    val ISGETTER = 0w4
    val ISSETTER = 0w8
    val WRAPSVFUNC = 0w16
    val THROWS = 0w32
    val allFlags =
      [
        ISMETHOD,
        ISCONSTRUCTOR,
        ISGETTER,
        ISSETTER,
        WRAPSVFUNC,
        THROWS
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
