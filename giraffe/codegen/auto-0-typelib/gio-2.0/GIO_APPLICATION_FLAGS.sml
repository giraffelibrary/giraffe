signature GIO_APPLICATION_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val FLAGS_NONE : t
    val IS_SERVICE : t
    val IS_LAUNCHER : t
    val HANDLES_OPEN : t
    val HANDLES_COMMAND_LINE : t
    val SEND_ENVIRONMENT : t
    val NON_UNIQUE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
