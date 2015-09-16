signature GIO_TLS_CERTIFICATE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
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
