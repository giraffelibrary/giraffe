signature G_LIB_I_O_CONDITION =
  sig
    include FLAGS
    val IN : t
    val OUT : t
    val PRI : t
    val ERR : t
    val HUP : t
    val NVAL : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
