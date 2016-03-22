signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a fieldinfo baseinfo_class
  end
