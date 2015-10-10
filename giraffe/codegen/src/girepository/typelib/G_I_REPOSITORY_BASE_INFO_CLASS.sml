signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p

        val withPtr : (notnull p -> 'b) -> 'a t -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a t option -> 'b

        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
