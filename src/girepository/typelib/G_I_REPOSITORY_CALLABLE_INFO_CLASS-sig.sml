signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfo_class
    type 'a class = 'a callableinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
