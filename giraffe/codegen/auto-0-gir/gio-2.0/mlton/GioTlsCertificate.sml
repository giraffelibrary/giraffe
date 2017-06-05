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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIssuer_ = _import "g_tls_certificate_get_issuer" : GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p -> GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p;
    val verify_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_certificate_verify" :
              GioTlsCertificateClass.FFI.notnull GioTlsCertificateClass.FFI.p
               * unit GioSocketConnectableClass.FFI.p
               * unit GioTlsCertificateClass.FFI.p
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
    fun newFromFile file = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioTlsCertificateClass.FFI.fromPtr true) newFromFile_ (file & [])
    fun newFromFiles certFile keyFile =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        newFromFiles_
        (
          certFile
           & keyFile
           & []
        )
    fun newFromPem data length =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        newFromPem_
        (
          data
           & length
           & []
        )
    fun getIssuer self = (GioTlsCertificateClass.FFI.withPtr ---> GioTlsCertificateClass.FFI.fromPtr false) getIssuer_ self
    fun verify self identity trustedCa =
      (
        GioTlsCertificateClass.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withOptPtr
         &&&> GioTlsCertificateClass.FFI.withOptPtr
         ---> GioTlsCertificateFlags.FFI.fromVal
      )
        verify_
        (
          self
           & identity
           & trustedCa
        )
    local
      open Property
    in
      val certificatePemProp =
        {
          get = fn x => get "certificate-pem" stringOpt x,
          set = fn x => set "certificate-pem" stringOpt x
        }
      val issuerProp =
        {
          get = fn x => get "issuer" GioTlsCertificateClass.tOpt x,
          set = fn x => set "issuer" GioTlsCertificateClass.tOpt x
        }
      val privateKeyPemProp = {set = fn x => set "private-key-pem" stringOpt x}
    end
  end
