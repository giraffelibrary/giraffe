signature GTK_JUNCTION_SIDES =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val NONE : t
    val CORNERTOPLEFT : t
    val CORNERTOPRIGHT : t
    val CORNERBOTTOMLEFT : t
    val CORNERBOTTOMRIGHT : t
    val TOP : t
    val BOTTOM : t
    val LEFT : t
    val RIGHT : t
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
