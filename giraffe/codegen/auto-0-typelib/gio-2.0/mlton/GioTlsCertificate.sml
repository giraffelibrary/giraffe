structure GioTlsCertificate :>
  GIO_TLS_CERTIFICATE
    where type 'a class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_tls_certificate_get_type" : unit -> GObjectType.FFI.val_;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_tls_certificate_new_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromFiles_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_tls_certificate_new_from_files" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromPem_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_tls_certificate_new_from_pem" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIssuer_ = _import "g_tls_certificate_get_issuer" : GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
    val isSame_ = fn x1 & x2 => (_import "g_tls_certificate_is_same" : GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val verify_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_certificate_verify" :
              GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p
               * GioSocketConnectableClass.FFI.opt GioSocketConnectableClass.FFI.p
               * GioTlsCertificateClass.FFI.opt GioTlsCertificateClass.FFI.p
               -> GioTlsCertificateFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioTlsCertificateClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromFile file = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GioTlsCertificateClass.FFI.fromPtr true) newFromFile_ (file & [])
    fun newFromFiles (certFile, keyFile) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        newFromFiles_
        (
          certFile
           & keyFile
           & []
        )
    fun newFromPem (data, length) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        newFromPem_
        (
          data
           & length
           & []
        )
    fun getIssuer self = (GioTlsCertificateClass.FFI.withPtr false ---> GioTlsCertificateClass.FFI.fromPtr false) getIssuer_ self before GioTlsCertificateClass.FFI.touchPtr self
    fun isSame self certTwo = (GioTlsCertificateClass.FFI.withPtr false &&&> GioTlsCertificateClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSame_ (self & certTwo)
    fun verify self (identity, trustedCa) =
      (
        GioTlsCertificateClass.FFI.withPtr false
         &&&> GioSocketConnectableClass.FFI.withOptPtr false
         &&&> GioTlsCertificateClass.FFI.withOptPtr false
         ---> GioTlsCertificateFlags.FFI.fromVal
      )
        verify_
        (
          self
           & identity
           & trustedCa
        )
    local
      open ValueAccessor
    in
      val certificatePemProp =
        {
          name = "certificate-pem",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val issuerProp =
        {
          name = "issuer",
          gtype = fn () => C.gtype GioTlsCertificateClass.tOpt (),
          get = fn x => fn () => C.get GioTlsCertificateClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioTlsCertificateClass.tOpt x
        }
      val privateKeyPemProp =
        {
          name = "private-key-pem",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
