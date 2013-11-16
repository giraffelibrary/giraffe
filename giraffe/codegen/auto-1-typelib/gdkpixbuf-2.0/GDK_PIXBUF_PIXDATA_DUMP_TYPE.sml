signature GDK_PIXBUF_PIXDATA_DUMP_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val PIXDATASTREAM : t
    val PIXDATASTRUCT : t
    val MACROS : t
    val GTYPES : t
    val CTYPES : t
    val STATIC : t
    val CONST : t
    val RLEDECODER : t
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
