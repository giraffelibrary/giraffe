structure GObjectSignalMatchType :>
  sig
    include G_OBJECT_SIGNAL_MATCH_TYPE
  end =
  struct
    val ID = 0w1
    val DETAIL = 0w2
    val CLOSURE = 0w4
    val FUNC = 0w8
    val DATA = 0w16
    val UNBLOCKED = 0w32
    val allFlags =
      [
        ID,
        DETAIL,
        CLOSURE,
        FUNC,
        DATA,
        UNBLOCKED
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
