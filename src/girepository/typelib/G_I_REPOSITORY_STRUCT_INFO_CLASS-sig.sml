signature G_I_REPOSITORY_STRUCT_INFO_CLASS =
  sig
    type 'a structinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a structinfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
