signature GIO_SETTINGS_BIND_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DEFAULT : t
    val GET : t
    val SET : t
    val NO_SENSITIVITY : t
    val GET_NO_CHANGES : t
    val INVERT_BOOLEAN : t
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
