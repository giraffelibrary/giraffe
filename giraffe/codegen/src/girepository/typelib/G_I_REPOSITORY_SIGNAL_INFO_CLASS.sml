signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfo_class
    type 'a class = 'a signalinfo callableinfo_class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
