structure GLibFormatSizeFlags :>
  sig
    include G_LIB_FORMAT_SIZE_FLAGS
  end =
  struct
    val DEFAULT = 0w0
    val LONGFORMAT = 0w1
    val IECUNITS = 0w2
    val allFlags =
      [
        DEFAULT,
        LONGFORMAT,
        IECUNITS
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
