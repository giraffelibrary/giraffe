signature GIO_TLS_DATABASE_VERIFY_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end