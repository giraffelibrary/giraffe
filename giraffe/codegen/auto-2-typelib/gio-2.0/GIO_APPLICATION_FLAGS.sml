signature GIO_APPLICATION_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val FLAGSNONE : t
    val ISSERVICE : t
    val ISLAUNCHER : t
    val HANDLESOPEN : t
    val HANDLESCOMMANDLINE : t
    val SENDENVIRONMENT : t
    val NONUNIQUE : t
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
