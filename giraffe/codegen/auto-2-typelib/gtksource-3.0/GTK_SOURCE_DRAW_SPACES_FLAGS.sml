signature GTK_SOURCE_DRAW_SPACES_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SPACE : t
    val TAB : t
    val NEWLINE : t
    val NBSP : t
    val LEADING : t
    val TEXT : t
    val TRAILING : t
    val ALL : t
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
