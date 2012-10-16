signature G_LIB_REGEX_COMPILE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val CASELESS : t
    val MULTILINE : t
    val DOTALL : t
    val EXTENDED : t
    val ANCHORED : t
    val DOLLARENDONLY : t
    val UNGREEDY : t
    val RAW : t
    val NOAUTOCAPTURE : t
    val OPTIMIZE : t
    val DUPNAMES : t
    val NEWLINECR : t
    val NEWLINELF : t
    val NEWLINECRLF : t
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
