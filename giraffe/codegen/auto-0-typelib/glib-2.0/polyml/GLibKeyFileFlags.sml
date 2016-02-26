structure GLibKeyFileFlags :>
  sig
    include G_LIB_KEY_FILE_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val KEEP_COMMENTS = 0w1
    val KEEP_TRANSLATIONS = 0w2
    val allFlags =
      [
        NONE,
        KEEP_COMMENTS,
        KEEP_TRANSLATIONS
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
