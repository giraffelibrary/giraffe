signature G_OBJECT_SIGNAL_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val RUNFIRST : t
    val RUNLAST : t
    val RUNCLEANUP : t
    val NORECURSE : t
    val DETAILED : t
    val ACTION : t
    val NOHOOKS : t
    val MUSTCOLLECT : t
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
