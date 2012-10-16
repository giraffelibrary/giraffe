structure GLibIOFlags :>
  sig
    include G_LIB_I_O_FLAGS
  end =
  struct
    val APPEND = 0w1
    val NONBLOCK = 0w2
    val ISREADABLE = 0w4
    val ISWRITEABLE = 0w8
    val ISSEEKABLE = 0w16
    val MASK = 0w31
    val GETMASK = 0w31
    val SETMASK = 0w3
    val allFlags =
      [
        APPEND,
        NONBLOCK,
        ISREADABLE,
        ISWRITEABLE,
        ISSEEKABLE,
        MASK,
        GETMASK,
        SETMASK
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
