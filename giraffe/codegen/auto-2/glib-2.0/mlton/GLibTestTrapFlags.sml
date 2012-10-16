structure GLibTestTrapFlags :>
  sig
    include G_LIB_TEST_TRAP_FLAGS
  end =
  struct
    val SILENCESTDOUT = 0w128
    val SILENCESTDERR = 0w256
    val INHERITSTDIN = 0w512
    val allFlags =
      [
        SILENCESTDOUT,
        SILENCESTDERR,
        INHERITSTDIN
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
