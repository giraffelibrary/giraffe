structure GLibRegexCompileFlags :>
  sig
    include G_LIB_REGEX_COMPILE_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val CASELESS = 0w1
    val MULTILINE = 0w2
    val DOTALL = 0w4
    val EXTENDED = 0w8
    val ANCHORED = 0w16
    val DOLLARENDONLY = 0w32
    val UNGREEDY = 0w512
    val RAW = 0w2048
    val NOAUTOCAPTURE = 0w4096
    val OPTIMIZE = 0w8192
    val DUPNAMES = 0w524288
    val NEWLINECR = 0w1048576
    val NEWLINELF = 0w2097152
    val NEWLINECRLF = 0w3145728
    val allFlags =
      [
        CASELESS,
        MULTILINE,
        DOTALL,
        EXTENDED,
        ANCHORED,
        DOLLARENDONLY,
        UNGREEDY,
        RAW,
        NOAUTOCAPTURE,
        OPTIMIZE,
        DUPNAMES,
        NEWLINECR,
        NEWLINELF,
        NEWLINECRLF
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
