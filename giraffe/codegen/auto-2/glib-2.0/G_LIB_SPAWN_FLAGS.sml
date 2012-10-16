signature G_LIB_SPAWN_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val LEAVEDESCRIPTORSOPEN : t
    val DONOTREAPCHILD : t
    val SEARCHPATH : t
    val STDOUTTODEVNULL : t
    val STDERRTODEVNULL : t
    val CHILDINHERITSSTDIN : t
    val FILEANDARGVZERO : t
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
