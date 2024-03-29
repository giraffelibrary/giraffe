signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfo_class
    type 'a class = 'a valueinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
