signature GIO_ASK_PASSWORD_FLAGS =
  sig
    include FLAGS
    val NEED_PASSWORD : t
    val NEED_USERNAME : t
    val NEED_DOMAIN : t
    val SAVING_SUPPORTED : t
    val ANONYMOUS_SUPPORTED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
