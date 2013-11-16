signature GDK_WINDOW_HINTS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val POS : t
    val MINSIZE : t
    val MAXSIZE : t
    val BASESIZE : t
    val ASPECT : t
    val RESIZEINC : t
    val WINGRAVITY : t
    val USERPOS : t
    val USERSIZE : t
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
