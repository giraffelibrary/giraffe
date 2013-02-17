signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfoclass_t
    type 'a t = 'a valueinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
