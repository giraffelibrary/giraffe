signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a interfaceinfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
