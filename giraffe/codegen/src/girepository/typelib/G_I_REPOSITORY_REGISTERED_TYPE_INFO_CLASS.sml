signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfoclass_t
    type 'a t = 'a registeredtypeinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
