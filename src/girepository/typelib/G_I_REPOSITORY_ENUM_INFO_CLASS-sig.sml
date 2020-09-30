signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfo_class
    include CLASS where type 'a class = 'a enuminfo registeredtypeinfo_class
  end
