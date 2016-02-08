structure GioTlsCertificate :>
  GIO_TLS_CERTIFICATE
    where type 'a class_t = 'a GioTlsCertificateClass.t
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_certificate_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFromFile_ = call (load_sym libgio "g_tls_certificate_new_from_file") (Utf8.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newFromFiles_ =
        call (load_sym libgio "g_tls_certificate_new_from_files")
          (
            Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromPem_ =
        call (load_sym libgio "g_tls_certificate_new_from_pem")
          (
            Utf8.PolyML.INPTR
             &&> FFI.Int64.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getIssuer_ = call (load_sym libgio "g_tls_certificate_get_issuer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val verify_ =
        call (load_sym libgio "g_tls_certificate_verify")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> GioTlsCertificateFlags.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioTlsCertificateClass.t
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile file = (Utf8.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GioTlsCertificateClass.C.fromPtr true) newFromFile_ (file & [])
    fun newFromFiles certFile keyFile =
      (
        Utf8.C.withConstPtr
         &&&> Utf8.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        Utf8.C.withConstPtr
         &&&> FFI.Int64.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
