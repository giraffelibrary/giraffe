signature GTK_RECENT_FILTER_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val URI : t
    val DISPLAYNAME : t
    val MIMETYPE : t
    val APPLICATION : t
    val GROUP : t
    val AGE : t
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
