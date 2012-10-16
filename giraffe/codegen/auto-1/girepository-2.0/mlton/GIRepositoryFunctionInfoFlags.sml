structure GIRepositoryFunctionInfoFlags :>
  sig
    include G_I_REPOSITORY_FUNCTION_INFO_FLAGS
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
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
  end
