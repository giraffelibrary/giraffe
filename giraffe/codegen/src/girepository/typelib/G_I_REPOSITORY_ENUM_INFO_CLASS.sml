signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a enuminfo registeredtypeinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
