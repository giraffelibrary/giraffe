signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfo_class
    type 'a class = 'a registeredtypeinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
