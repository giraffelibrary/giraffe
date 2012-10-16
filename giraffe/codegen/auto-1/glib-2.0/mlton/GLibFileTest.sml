structure GLibFileTest :>
  sig
    include G_LIB_FILE_TEST
  end =
  struct
    val ISREGULAR = 0w1
    val ISSYMLINK = 0w2
    val ISDIR = 0w4
    val ISEXECUTABLE = 0w8
    val EXISTS = 0w16
    val allFlags =
      [
        ISREGULAR,
        ISSYMLINK,
        ISDIR,
        ISEXECUTABLE,
        EXISTS
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
