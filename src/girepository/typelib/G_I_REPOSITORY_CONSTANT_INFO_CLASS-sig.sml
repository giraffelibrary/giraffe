signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfo_class
    type 'a class = 'a constantinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
