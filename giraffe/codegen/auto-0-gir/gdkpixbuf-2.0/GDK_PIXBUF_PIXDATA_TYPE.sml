signature GDK_PIXBUF_PIXDATA_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val COLOR_TYPE_RGB : t
    val COLOR_TYPE_RGBA : t
    val COLOR_TYPE_MASK : t
    val SAMPLE_WIDTH_8 : t
    val SAMPLE_WIDTH_MASK : t
    val ENCODING_RAW : t
    val ENCODING_RLE : t
    val ENCODING_MASK : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
