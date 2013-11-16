signature G_LIB_MARKUP_COLLECT_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val INVALID : t
    val STRING : t
    val STRDUP : t
    val BOOLEAN : t
    val TRISTATE : t
    val OPTIONAL : t
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
