structure GIRepositoryFunctionInfoFlags :>
  sig
    include G_I_REPOSITORY_FUNCTION_INFO_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val IS_METHOD = 0w1
    val IS_CONSTRUCTOR = 0w2
    val IS_GETTER = 0w4
    val IS_SETTER = 0w8
    val WRAPS_VFUNC = 0w16
    val THROWS = 0w32
    val allFlags =
      [
        IS_METHOD,
        IS_CONSTRUCTOR,
        IS_GETTER,
        IS_SETTER,
        WRAPS_VFUNC,
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
        val cVal = FFI.Flags.PolyML.cVal
        val cRef = FFI.Flags.PolyML.cRef
      end
  end
