signature GTK_CELL_RENDERER_STATE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SELECTED : t
    val PRELIT : t
    val INSENSITIVE : t
    val SORTED : t
    val FOCUSED : t
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
