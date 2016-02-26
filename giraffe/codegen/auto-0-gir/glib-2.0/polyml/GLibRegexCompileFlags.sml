structure GLibRegexCompileFlags :>
  sig
    include G_LIB_REGEX_COMPILE_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val CASELESS = 0w1
    val MULTILINE = 0w2
    val DOTALL = 0w4
    val EXTENDED = 0w8
    val ANCHORED = 0w16
    val DOLLAR_ENDONLY = 0w32
    val UNGREEDY = 0w512
    val RAW = 0w2048
    val NO_AUTO_CAPTURE = 0w4096
    val OPTIMIZE = 0w8192
    val DUPNAMES = 0w524288
    val NEWLINE_CR = 0w1048576
    val NEWLINE_LF = 0w2097152
    val NEWLINE_CRLF = 0w3145728
    val allFlags =
      [
        CASELESS,
        MULTILINE,
        DOTALL,
        EXTENDED,
        ANCHORED,
        DOLLAR_ENDONLY,
        UNGREEDY,
        RAW,
        NO_AUTO_CAPTURE,
        OPTIMIZE,
        DUPNAMES,
        NEWLINE_CR,
        NEWLINE_LF,
        NEWLINE_CRLF
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
