signature G_LIB_I_O_CONDITION =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val IN : t
    val OUT : t
    val PRI : t
    val ERR : t
    val HUP : t
    val NVAL : t
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
