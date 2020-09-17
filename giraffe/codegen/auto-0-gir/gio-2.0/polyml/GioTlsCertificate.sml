structure GioTlsCertificate :>
  GIO_TLS_CERTIFICATE
    where type 'a class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_certificate_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFromFile_ = call (getSymbol "g_tls_certificate_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioTlsCertificateClass.PolyML.cPtr)
      val newFromFiles_ =
        call (getSymbol "g_tls_certificate_new_from_files")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cPtr
          )
      val newFromPem_ =
        call (getSymbol "g_tls_certificate_new_from_pem")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cPtr
          )
      val getIssuer_ = call (getSymbol "g_tls_certificate_get_issuer") (GioTlsCertificateClass.PolyML.cPtr --> GioTlsCertificateClass.PolyML.cPtr)
      val isSame_ = call (getSymbol "g_tls_certificate_is_same") (GioTlsCertificateClass.PolyML.cPtr &&> GioTlsCertificateClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val verify_ =
        call (getSymbol "g_tls_certificate_verify")
          (
            GioTlsCertificateClass.PolyML.cPtr
             &&> GioSocketConnectableClass.PolyML.cOptPtr
             &&> GioTlsCertificateClass.PolyML.cOptPtr
             --> GioTlsCertificateFlags.PolyML.cVal
          )
    end
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
