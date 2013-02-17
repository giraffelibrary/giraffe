signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfoclass_t
    type 'a t = 'a signalinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
