signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfoclass_t
    type 'a t = 'a functioninfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
