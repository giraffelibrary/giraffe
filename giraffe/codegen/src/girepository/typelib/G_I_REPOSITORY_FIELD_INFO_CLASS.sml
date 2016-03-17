signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfo_class
    type 'a class = 'a fieldinfo baseinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
