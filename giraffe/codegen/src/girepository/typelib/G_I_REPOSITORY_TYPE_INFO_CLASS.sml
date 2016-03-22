signature G_I_REPOSITORY_TYPE_INFO_CLASS =
  sig
    type 'a typeinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a typeinfo baseinfo_class
  end
