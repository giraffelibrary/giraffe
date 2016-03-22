signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a callableinfo baseinfo_class
  end
