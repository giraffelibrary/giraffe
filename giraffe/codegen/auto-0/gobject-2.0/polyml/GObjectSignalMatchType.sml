structure GObjectSignalMatchType :>
  sig
    include G_OBJECT_SIGNAL_MATCH_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Flags.VAL
        val REF = FFI.PolyML.Flags.REF
      end
  end
