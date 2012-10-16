structure GdkPixbufPixdataType :>
  sig
    include GDK_PIXBUF_PIXDATA_TYPE
  end =
  struct
    val COLORTYPERGB = 0w1
    val COLORTYPERGBA = 0w2
    val COLORTYPEMASK = 0w255
    val SAMPLEWIDTH8 = 0w65536
    val SAMPLEWIDTHMASK = 0w983040
    val ENCODINGRAW = 0w16777216
    val ENCODINGRLE = 0w33554432
    val ENCODINGMASK = 0w251658240
    val allFlags =
      [
        COLORTYPERGB,
        COLORTYPERGBA,
        COLORTYPEMASK,
        SAMPLEWIDTH8,
        SAMPLEWIDTHMASK,
        ENCODINGRAW,
        ENCODINGRLE,
        ENCODINGMASK
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
  end
