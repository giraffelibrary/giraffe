signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfo_class
    type 'a class = 'a fieldinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
