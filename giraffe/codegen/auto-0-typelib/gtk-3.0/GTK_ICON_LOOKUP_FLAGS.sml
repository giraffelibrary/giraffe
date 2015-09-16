signature GTK_ICON_LOOKUP_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val NO_SVG : t
    val FORCE_SVG : t
    val USE_BUILTIN : t
    val GENERIC_FALLBACK : t
    val FORCE_SIZE : t
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
