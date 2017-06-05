signature GIO_TLS_PASSWORD_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val RETRY : t
    val MANY_TRIES : t
    val FINAL_TRY : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
