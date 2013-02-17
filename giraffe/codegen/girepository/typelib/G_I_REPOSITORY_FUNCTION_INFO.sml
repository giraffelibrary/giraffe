signature G_I_REPOSITORY_FUNCTION_INFO =
  sig
    type 'a class_t
    type 'a propertyinfoclass_t
    type 'a vfuncinfoclass_t
    type functioninfoflags_t
    val getSymbol : 'a class_t -> string
    val getFlags : 'a class_t -> functioninfoflags_t
    val getProperty : 'a class_t -> base propertyinfoclass_t
    val getVfunc : 'a class_t -> base vfuncinfoclass_t
  end
