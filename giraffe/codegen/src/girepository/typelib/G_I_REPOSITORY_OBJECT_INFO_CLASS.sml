signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a objectinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
