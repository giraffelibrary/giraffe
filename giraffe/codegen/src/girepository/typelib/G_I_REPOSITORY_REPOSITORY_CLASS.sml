signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    type 'a object_class
    type 'a class = 'a repository object_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
