signature G_I_REPOSITORY_PROPERTY_INFO_CLASS =
  sig
    type 'a propertyinfo
    type 'a baseinfo_class
    type 'a class = 'a propertyinfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
