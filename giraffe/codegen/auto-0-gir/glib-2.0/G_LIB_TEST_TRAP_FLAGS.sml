signature G_LIB_TEST_TRAP_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SILENCE_STDOUT : t
    val SILENCE_STDERR : t
    val INHERIT_STDIN : t
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
