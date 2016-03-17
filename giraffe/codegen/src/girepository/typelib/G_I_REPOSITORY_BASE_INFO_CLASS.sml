signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p

        val withPtr : (notnull p -> 'b) -> 'a class -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a class option -> 'b

        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
