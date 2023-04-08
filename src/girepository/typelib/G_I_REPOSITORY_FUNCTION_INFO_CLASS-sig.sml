signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfo_class
    type 'a class = 'a functioninfo callableinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
