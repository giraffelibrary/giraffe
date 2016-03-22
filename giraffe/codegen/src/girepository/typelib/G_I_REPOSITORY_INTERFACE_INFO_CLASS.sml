signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfo_class
    include CLASS where type 'a class = 'a interfaceinfo registeredtypeinfo_class
  end
