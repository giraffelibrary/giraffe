signature G_LIB_FILE_TEST =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ISREGULAR : t
    val ISSYMLINK : t
    val ISDIR : t
    val ISEXECUTABLE : t
    val EXISTS : t
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
