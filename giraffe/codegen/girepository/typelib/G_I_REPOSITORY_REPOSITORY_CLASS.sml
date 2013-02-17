signature G_I_REPOSITORY_REPOSITORY_CLASS =
  sig
    type 'a repository
    type 'a objectclass_t
    type 'a t = 'a repository objectclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
