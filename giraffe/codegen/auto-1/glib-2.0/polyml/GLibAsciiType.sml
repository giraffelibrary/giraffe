structure GLibAsciiType :>
  sig
    include G_LIB_ASCII_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
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
