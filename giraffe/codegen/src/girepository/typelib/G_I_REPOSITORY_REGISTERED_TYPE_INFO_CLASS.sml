signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfo_class
    type 'a class = 'a registeredtypeinfo baseinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
