structure GioTlsCertificate :>
  GIO_TLS_CERTIFICATE
    where type 'a class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    val getType_ = _import "g_tls_certificate_get_type" : unit -> GObjectType.C.val_;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_tls_certificate_new_from_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.SSize.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIssuer_ = _import "g_tls_certificate_get_issuer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val verify_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_certificate_verify" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> GioTlsCertificateFlags.C.val_;
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile file = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioTlsCertificateClass.C.fromPtr true) newFromFile_ (file & [])
    fun newFromFiles certFile keyFile =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        newFromFiles_
        (
          certFile
           & keyFile
           & []
        )
    fun newFromPem data length =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        newFromPem_
        (
          data
           & length
           & []
        )
    fun getIssuer self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateClass.C.fromPtr false) getIssuer_ self
    fun verify self identity trustedCa =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> GioTlsCertificateFlags.C.fromVal
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
