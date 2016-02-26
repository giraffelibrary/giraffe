structure GIRepositoryVFuncInfoFlags :>
  sig
    include G_I_REPOSITORY_V_FUNC_INFO_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val MUSTCHAINUP = 0w1
    val MUSTOVERRIDE = 0w2
    val MUSTNOTOVERRIDE = 0w4
    val THROWS = 0w8
    val allFlags =
      [
        MUSTCHAINUP,
        MUSTOVERRIDE,
        MUSTNOTOVERRIDE,
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
