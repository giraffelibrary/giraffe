structure GLibSpawnFlags :>
  sig
    include G_LIB_SPAWN_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val LEAVE_DESCRIPTORS_OPEN = 0w1
    val DO_NOT_REAP_CHILD = 0w2
    val SEARCH_PATH = 0w4
    val STDOUT_TO_DEV_NULL = 0w8
    val STDERR_TO_DEV_NULL = 0w16
    val CHILD_INHERITS_STDIN = 0w32
    val FILE_AND_ARGV_ZERO = 0w64
    val allFlags =
      [
        LEAVE_DESCRIPTORS_OPEN,
        DO_NOT_REAP_CHILD,
        SEARCH_PATH,
        STDOUT_TO_DEV_NULL,
        STDERR_TO_DEV_NULL,
        CHILD_INHERITS_STDIN,
        FILE_AND_ARGV_ZERO
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
