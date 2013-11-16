signature GDK_W_M_DECORATION =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ALL : t
    val BORDER : t
    val RESIZEH : t
    val TITLE : t
    val MENU : t
    val MINIMIZE : t
    val MAXIMIZE : t
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
