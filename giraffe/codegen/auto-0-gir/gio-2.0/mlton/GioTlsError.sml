structure GioTlsError :>
  sig
    include GIO_TLS_ERROR
  end =
  struct
    datatype t =
      UNAVAILABLE
    | MISC
    | BAD_CERTIFICATE
    | NOT_TLS
    | HANDSHAKE
    | CERTIFICATE_REQUIRED
    | EOF
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNAVAILABLE => f 0
          | MISC => f 1
          | BAD_CERTIFICATE => f 2
          | NOT_TLS => f 3
          | HANDSHAKE => f 4
          | CERTIFICATE_REQUIRED => f 5
          | EOF => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNAVAILABLE
          | 1 => MISC
          | 2 => BAD_CERTIFICATE
          | 3 => NOT_TLS
          | 4 => HANDSHAKE
          | 5 => CERTIFICATE_REQUIRED
          | 6 => EOF
          | n => raise Value n
      end
    val getType_ = _import "g_tls_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-tls-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GioTlsError = GioTlsError.Error
