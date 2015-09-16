structure GioTlsCertificateFlags :>
  sig
    include GIO_TLS_CERTIFICATE_FLAGS
  end =
  struct
    val UNKNOWN_CA = 0w1
    val BAD_IDENTITY = 0w2
    val NOT_ACTIVATED = 0w4
    val EXPIRED = 0w8
    val REVOKED = 0w16
    val INSECURE = 0w32
    val GENERIC_ERROR = 0w64
    val VALIDATE_ALL = 0w127
    val allFlags =
      [
        UNKNOWN_CA,
        BAD_IDENTITY,
        NOT_ACTIVATED,
        EXPIRED,
        REVOKED,
        INSECURE,
        GENERIC_ERROR,
        VALIDATE_ALL
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "g_tls_certificate_flags_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
