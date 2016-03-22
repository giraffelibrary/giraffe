signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfo_class
    include CLASS where type 'a class = 'a objectinfo registeredtypeinfo_class
  end
