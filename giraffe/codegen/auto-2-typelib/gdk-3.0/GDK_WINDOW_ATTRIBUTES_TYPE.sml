signature GDK_WINDOW_ATTRIBUTES_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val TITLE : t
    val X : t
    val Y : t
    val CURSOR : t
    val VISUAL : t
    val WMCLASS : t
    val NOREDIR : t
    val TYPEHINT : t
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
