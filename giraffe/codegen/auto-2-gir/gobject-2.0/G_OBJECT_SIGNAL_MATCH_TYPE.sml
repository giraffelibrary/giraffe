signature G_OBJECT_SIGNAL_MATCH_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ID : t
    val DETAIL : t
    val CLOSURE : t
    val FUNC : t
    val DATA : t
    val UNBLOCKED : t
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
