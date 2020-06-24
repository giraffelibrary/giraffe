structure GioTlsCertificateFlags :> GIO_TLS_CERTIFICATE_FLAGS =
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
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_tls_certificate_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
