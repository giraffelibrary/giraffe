signature GIO_TLS_CERTIFICATE_FLAGS =
  sig
    include FLAGS
    val UNKNOWN_CA : t
    val BAD_IDENTITY : t
    val NOT_ACTIVATED : t
    val EXPIRED : t
    val REVOKED : t
    val INSECURE : t
    val GENERIC_ERROR : t
    val VALIDATE_ALL : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
