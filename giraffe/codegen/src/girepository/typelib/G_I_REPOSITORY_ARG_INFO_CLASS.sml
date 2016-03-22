signature G_I_REPOSITORY_ARG_INFO_CLASS =
  sig
    type 'a arginfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a arginfo baseinfo_class
  end
