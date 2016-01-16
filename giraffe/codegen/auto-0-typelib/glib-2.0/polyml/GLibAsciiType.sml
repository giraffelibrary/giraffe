structure GLibAsciiType :>
  sig
    include G_LIB_ASCII_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val ALNUM = 0w1
    val ALPHA = 0w2
    val CNTRL = 0w4
    val DIGIT = 0w8
    val GRAPH = 0w16
    val LOWER = 0w32
    val PRINT = 0w64
    val PUNCT = 0w128
    val SPACE = 0w256
    val UPPER = 0w512
    val XDIGIT = 0w1024
    val allFlags =
      [
        ALNUM,
        ALPHA,
        CNTRL,
        DIGIT,
        GRAPH,
        LOWER,
        PRINT,
        PUNCT,
        SPACE,
        UPPER,
        XDIGIT
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
