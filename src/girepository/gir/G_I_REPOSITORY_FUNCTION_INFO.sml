signature G_I_REPOSITORY_FUNCTION_INFO =
  sig
    type 'a class
    type 'a propertyinfo_class
    type 'a vfuncinfo_class
    type functioninfoflags_t
    val getSymbol : 'a class -> string
    val getFlags : 'a class -> functioninfoflags_t
    val getProperty : 'a class -> base propertyinfo_class option
    val getVfunc : 'a class -> base vfuncinfo_class option
    val getMovedTo : 'a class -> string option  (* GIR only *)
  end
