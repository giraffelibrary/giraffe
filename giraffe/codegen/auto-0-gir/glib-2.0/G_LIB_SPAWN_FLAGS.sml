signature G_LIB_SPAWN_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val LEAVE_DESCRIPTORS_OPEN : t
    val DO_NOT_REAP_CHILD : t
    val SEARCH_PATH : t
    val STDOUT_TO_DEV_NULL : t
    val STDERR_TO_DEV_NULL : t
    val CHILD_INHERITS_STDIN : t
    val FILE_AND_ARGV_ZERO : t
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
