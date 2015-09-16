signature G_OBJECT_TYPE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ABSTRACT : t
    val VALUE_ABSTRACT : t
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
