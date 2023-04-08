signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfo_class
    type 'a class = 'a vfuncinfo callableinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
