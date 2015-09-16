structure GLibTestTrapFlags :>
  sig
    include G_LIB_TEST_TRAP_FLAGS
  end =
  struct
    val SILENCE_STDOUT = 0w128
    val SILENCE_STDERR = 0w256
    val INHERIT_STDIN = 0w512
    val allFlags =
      [
        SILENCE_STDOUT,
        SILENCE_STDERR,
        INHERIT_STDIN
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
  end
