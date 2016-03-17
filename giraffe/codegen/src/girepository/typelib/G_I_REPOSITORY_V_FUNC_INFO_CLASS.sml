signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfo_class
    type 'a class = 'a vfuncinfo callableinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
