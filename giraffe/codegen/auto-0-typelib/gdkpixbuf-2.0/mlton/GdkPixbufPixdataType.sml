structure GdkPixbufPixdataType :>
  sig
    include GDK_PIXBUF_PIXDATA_TYPE
  end =
  struct
    val COLOR_TYPE_RGB = 0w1
    val COLOR_TYPE_RGBA = 0w2
    val COLOR_TYPE_MASK = 0w255
    val SAMPLE_WIDTH_8 = 0w65536
    val SAMPLE_WIDTH_MASK = 0w983040
    val ENCODING_RAW = 0w16777216
    val ENCODING_RLE = 0w33554432
    val ENCODING_MASK = 0w251658240
    val allFlags =
      [
        COLOR_TYPE_RGB,
        COLOR_TYPE_RGBA,
        COLOR_TYPE_MASK,
        SAMPLE_WIDTH_8,
        SAMPLE_WIDTH_MASK,
        ENCODING_RAW,
        ENCODING_RLE,
        ENCODING_MASK
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
