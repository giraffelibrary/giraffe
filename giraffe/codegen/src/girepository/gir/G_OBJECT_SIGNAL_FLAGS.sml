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
  end
