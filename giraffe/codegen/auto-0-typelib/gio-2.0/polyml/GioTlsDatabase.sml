structure GioTlsDatabase :>
  GIO_TLS_DATABASE
    where type 'a class = 'a GioTlsDatabaseClass.class
    where type tls_database_lookup_flags_t = GioTlsDatabaseLookupFlags.t
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type tls_database_verify_flags_t = GioTlsDatabaseVerifyFlags.t
    where type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_database_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createCertificateHandle_ = call (load_sym libgio "g_tls_database_create_certificate_handle") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val lookupCertificateForHandle_ =
        call (load_sym libgio "g_tls_database_lookup_certificate_for_handle")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GioTlsDatabaseLookupFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val lookupCertificateForHandleFinish_ =
        call (load_sym libgio "g_tls_database_lookup_certificate_for_handle_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val lookupCertificateIssuer_ =
        call (load_sym libgio "g_tls_database_lookup_certificate_issuer")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GioTlsDatabaseLookupFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val lookupCertificateIssuerFinish_ =
        call (load_sym libgio "g_tls_database_lookup_certificate_issuer_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val verifyChain_ =
        call (load_sym libgio "g_tls_database_verify_chain")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GioTlsDatabaseVerifyFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateFlags.PolyML.cVal
          )
      val verifyChainFinish_ =
        call (load_sym libgio "g_tls_database_verify_chain_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateFlags.PolyML.cVal
          )
    end
    type 'a class = 'a GioTlsDatabaseClass.class
    type tls_database_lookup_flags_t = GioTlsDatabaseLookupFlags.t
    type 'a cancellable_class = 'a GioCancellableClass.class
    type tls_database_verify_flags_t = GioTlsDatabaseVerifyFlags.t
    type 'a tls_interaction_class = 'a GioTlsInteractionClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createCertificateHandle self certificate = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) createCertificateHandle_ (self & certificate)
    fun lookupCertificateForHandle self handle' interaction flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GioTlsDatabaseLookupFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        lookupCertificateForHandle_
        (
          self
           & handle'
           & interaction
           & flags
           & cancellable
           & []
        )
    fun lookupCertificateForHandleFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        lookupCertificateForHandleFinish_
        (
          self
           & result
           & []
        )
    fun lookupCertificateIssuer self certificate interaction flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GioTlsDatabaseLookupFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        lookupCertificateIssuer_
        (
          self
           & certificate
           & interaction
           & flags
           & cancellable
           & []
        )
    fun lookupCertificateIssuerFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.C.fromPtr true
      )
        lookupCertificateIssuerFinish_
        (
          self
           & result
           & []
        )
    fun verifyChain self chain purpose identity interaction flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GioTlsDatabaseVerifyFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateFlags.C.fromVal
      )
        verifyChain_
        (
          self
           & chain
           & purpose
           & identity
           & interaction
           & flags
           & cancellable
           & []
        )
    fun verifyChainFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateFlags.C.fromVal
      )
        verifyChainFinish_
        (
          self
           & result
           & []
        )
  end
