signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfo_class
    type 'a class = 'a constantinfo baseinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
