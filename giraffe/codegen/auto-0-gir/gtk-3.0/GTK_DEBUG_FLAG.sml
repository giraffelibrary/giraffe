signature GTK_DEBUG_FLAG =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val MISC : t
    val PLUGSOCKET : t
    val TEXT : t
    val TREE : t
    val UPDATES : t
    val KEYBINDINGS : t
    val MULTIHEAD : t
    val MODULES : t
    val GEOMETRY : t
    val ICONTHEME : t
    val PRINTING : t
    val BUILDER : t
    val SIZE_REQUEST : t
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
