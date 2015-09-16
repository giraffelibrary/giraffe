signature G_OBJECT_SIGNAL_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val RUN_FIRST : t
    val RUN_LAST : t
    val RUN_CLEANUP : t
    val NO_RECURSE : t
    val DETAILED : t
    val ACTION : t
    val NO_HOOKS : t
    val MUST_COLLECT : t
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
