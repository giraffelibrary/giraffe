structure GdkPixbufPixdataDumpType :>
  sig
    include GDK_PIXBUF_PIXDATA_DUMP_TYPE
  end =
  struct
    val PIXDATA_STREAM = 0w0
    val PIXDATA_STRUCT = 0w1
    val MACROS = 0w2
    val GTYPES = 0w0
    val CTYPES = 0w256
    val STATIC = 0w512
    val CONST = 0w1024
    val RLE_DECODER = 0w65536
    val allFlags =
      [
        PIXDATA_STREAM,
        PIXDATA_STRUCT,
        MACROS,
        GTYPES,
        CTYPES,
        STATIC,
        CONST,
        RLE_DECODER
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
