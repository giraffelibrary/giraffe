structure GLibSpawnFlags :>
  sig
    include G_LIB_SPAWN_FLAGS
  end =
  struct
    val LEAVEDESCRIPTORSOPEN = 0w1
    val DONOTREAPCHILD = 0w2
    val SEARCHPATH = 0w4
    val STDOUTTODEVNULL = 0w8
    val STDERRTODEVNULL = 0w16
    val CHILDINHERITSSTDIN = 0w32
    val FILEANDARGVZERO = 0w64
    val allFlags =
      [
        LEAVEDESCRIPTORSOPEN,
        DONOTREAPCHILD,
        SEARCHPATH,
        STDOUTTODEVNULL,
        STDERRTODEVNULL,
        CHILDINHERITSSTDIN,
        FILEANDARGVZERO
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
