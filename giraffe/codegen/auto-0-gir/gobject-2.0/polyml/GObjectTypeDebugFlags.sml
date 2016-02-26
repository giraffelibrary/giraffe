structure GObjectTypeDebugFlags :>
  sig
    include G_OBJECT_TYPE_DEBUG_FLAGS
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
    structure PolyML =
      struct
        val cVal = FFI.Flags.PolyML.cVal
        val cRef = FFI.Flags.PolyML.cRef
      end
  end
