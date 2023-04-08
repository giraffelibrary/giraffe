signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a unioninfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
