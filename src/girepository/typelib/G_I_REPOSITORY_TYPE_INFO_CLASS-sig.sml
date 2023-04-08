signature G_I_REPOSITORY_TYPE_INFO_CLASS =
  sig
    type 'a typeinfo
    type 'a baseinfo_class
    type 'a class = 'a typeinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
