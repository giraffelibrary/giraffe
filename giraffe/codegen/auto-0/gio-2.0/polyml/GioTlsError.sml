structure GioTlsError :>
  sig
    include GIO_TLS_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      UNAVAILABLE
    | MISC
    | BADCERTIFICATE
    | NOTTLS
    | HANDSHAKE
    | CERTIFICATEREQUIRED
    | EOF
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNAVAILABLE => f 0
          | MISC => f 1
          | BADCERTIFICATE => f 2
          | NOTTLS => f 3
          | HANDSHAKE => f 4
          | CERTIFICATEREQUIRED => f 5
          | EOF => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNAVAILABLE
          | 1 => MISC
          | 2 => BADCERTIFICATE
          | 3 => NOTTLS
          | 4 => HANDSHAKE
          | 5 => CERTIFICATEREQUIRED
          | 6 => EOF
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
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
