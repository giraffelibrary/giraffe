signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a registeredtypeinfo baseinfo_class
  end
