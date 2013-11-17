signature GDK_PIXBUF_PIXDATA_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val COLORTYPERGB : t
    val COLORTYPERGBA : t
    val COLORTYPEMASK : t
    val SAMPLEWIDTH8 : t
    val SAMPLEWIDTHMASK : t
    val ENCODINGRAW : t
    val ENCODINGRLE : t
    val ENCODINGMASK : t
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
