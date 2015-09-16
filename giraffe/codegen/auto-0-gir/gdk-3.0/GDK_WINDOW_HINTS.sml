signature GDK_WINDOW_HINTS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val POS : t
    val MIN_SIZE : t
    val MAX_SIZE : t
    val BASE_SIZE : t
    val ASPECT : t
    val RESIZE_INC : t
    val WIN_GRAVITY : t
    val USER_POS : t
    val USER_SIZE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
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
