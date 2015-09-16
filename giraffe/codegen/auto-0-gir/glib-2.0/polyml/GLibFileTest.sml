structure GLibFileTest :>
  sig
    include G_LIB_FILE_TEST
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val IS_REGULAR = 0w1
    val IS_SYMLINK = 0w2
    val IS_DIR = 0w4
    val IS_EXECUTABLE = 0w8
    val EXISTS = 0w16
    val allFlags =
      [
        IS_REGULAR,
        IS_SYMLINK,
        IS_DIR,
        IS_EXECUTABLE,
        EXISTS
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
