signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a enuminfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
