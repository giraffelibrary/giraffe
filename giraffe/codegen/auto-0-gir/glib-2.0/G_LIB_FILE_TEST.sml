signature G_LIB_FILE_TEST =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val IS_REGULAR : t
    val IS_SYMLINK : t
    val IS_DIR : t
    val IS_EXECUTABLE : t
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
