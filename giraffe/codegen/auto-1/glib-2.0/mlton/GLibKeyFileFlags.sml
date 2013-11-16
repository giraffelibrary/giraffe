structure GLibKeyFileFlags :>
  sig
    include G_LIB_KEY_FILE_FLAGS
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val KEEPCOMMENTS = 0w1
    val KEEPTRANSLATIONS = 0w2
    val allFlags =
      [
        NONE,
        KEEPCOMMENTS,
        KEEPTRANSLATIONS
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
