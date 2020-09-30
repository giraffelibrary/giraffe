signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a valueinfo baseinfo_class
  end
