signature G_LIB_HOOK_FLAG_MASK =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ACTIVE : t
    val IN_CALL : t
    val MASK : t
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
