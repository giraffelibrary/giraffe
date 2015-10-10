signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
