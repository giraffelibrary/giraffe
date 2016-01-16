structure GLibIOFlags :>
  sig
    include G_LIB_I_O_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val APPEND = 0w1
    val NONBLOCK = 0w2
    val IS_READABLE = 0w4
    val IS_WRITEABLE = 0w8
    val IS_SEEKABLE = 0w16
    val MASK = 0w31
    val GET_MASK = 0w31
    val SET_MASK = 0w3
    val allFlags =
      [
        APPEND,
        NONBLOCK,
        IS_READABLE,
        IS_WRITEABLE,
        IS_SEEKABLE,
        MASK,
        GET_MASK,
        SET_MASK
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
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
  end
