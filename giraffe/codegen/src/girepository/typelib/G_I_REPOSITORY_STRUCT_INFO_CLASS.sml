signature G_I_REPOSITORY_STRUCT_INFO_CLASS =
  sig
    type 'a structinfo
    type 'a registeredtypeinfo_class
    include CLASS where type 'a class = 'a structinfo registeredtypeinfo_class
  end
