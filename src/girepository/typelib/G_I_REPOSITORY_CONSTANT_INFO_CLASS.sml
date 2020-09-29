signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfo_class
    include CLASS where type 'a class = 'a constantinfo baseinfo_class
  end
