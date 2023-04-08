signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a objectinfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
