signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfo_class
    include CLASS where type 'a class = 'a unioninfo registeredtypeinfo_class
  end
