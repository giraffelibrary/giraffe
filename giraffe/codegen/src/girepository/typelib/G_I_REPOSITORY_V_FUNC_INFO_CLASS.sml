signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfoclass_t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
