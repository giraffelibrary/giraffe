structure GLibFormatSizeFlags :>
  sig
    include G_LIB_FORMAT_SIZE_FLAGS
  end =
  struct
    val DEFAULT = 0w0
    val LONG_FORMAT = 0w1
    val IEC_UNITS = 0w2
    val allFlags =
      [
        DEFAULT,
        LONG_FORMAT,
        IEC_UNITS
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
