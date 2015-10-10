signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfoclass_t
    type 'a t = 'a callableinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
