structure GLibOptionFlags :>
  sig
    include G_LIB_OPTION_FLAGS
  end =
  struct
    val HIDDEN = 0w1
    val INMAIN = 0w2
    val REVERSE = 0w4
    val NOARG = 0w8
    val FILENAME = 0w16
    val OPTIONALARG = 0w32
    val NOALIAS = 0w64
    val allFlags =
      [
        HIDDEN,
        INMAIN,
        REVERSE,
        NOARG,
        FILENAME,
        OPTIONALARG,
        NOALIAS
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
