structure GObjectTypeDebugFlags :>
  sig
    include G_OBJECT_TYPE_DEBUG_FLAGS
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val OBJECTS = 0w1
    val SIGNALS = 0w2
    val MASK = 0w3
    val allFlags =
      [
        NONE,
        OBJECTS,
        SIGNALS,
        MASK
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