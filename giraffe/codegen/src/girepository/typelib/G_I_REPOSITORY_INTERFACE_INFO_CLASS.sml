signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a interfaceinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
