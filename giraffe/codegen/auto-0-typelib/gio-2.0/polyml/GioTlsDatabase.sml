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
      val getType_ = call (getSymbol "g_tls_database_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val createCertificateHandle_ = call (getSymbol "g_tls_database_create_certificate_handle") (GioTlsDatabaseClass.PolyML.cPtr &&> GioTlsCertificateClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val lookupCertificateForHandle_ =
        call (getSymbol "g_tls_database_lookup_certificate_for_handle")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioTlsInteractionClass.PolyML.cOptPtr
             &&> GioTlsDatabaseLookupFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cOptPtr
          )
      val lookupCertificateForHandleFinish_ =
        call (getSymbol "g_tls_database_lookup_certificate_for_handle_finish")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cPtr
          )
      val lookupCertificateIssuer_ =
        call (getSymbol "g_tls_database_lookup_certificate_issuer")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cPtr
             &&> GioTlsInteractionClass.PolyML.cOptPtr
             &&> GioTlsDatabaseLookupFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cPtr
          )
      val lookupCertificateIssuerFinish_ =
        call (getSymbol "g_tls_database_lookup_certificate_issuer_finish")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateClass.PolyML.cPtr
          )
      val verifyChain_ =
        call (getSymbol "g_tls_database_verify_chain")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioSocketConnectableClass.PolyML.cOptPtr
             &&> GioTlsInteractionClass.PolyML.cOptPtr
             &&> GioTlsDatabaseVerifyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioTlsCertificateFlags.PolyML.cVal
          )
      val verifyChainFinish_ =
        call (getSymbol "g_tls_database_verify_chain_finish")
          (
            GioTlsDatabaseClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createCertificateHandle self certificate = (GioTlsDatabaseClass.FFI.withPtr false &&&> GioTlsCertificateClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) createCertificateHandle_ (self & certificate)
    fun lookupCertificateForHandle
      self
      (
        handle',
        interaction,
        flags,
        cancellable
      ) =
      (
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioTlsInteractionClass.FFI.withOptPtr false
         &&&> GioTlsDatabaseLookupFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromOptPtr true
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
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        lookupCertificateForHandleFinish_
        (
          self
           & result
           & []
        )
    fun lookupCertificateIssuer
      self
      (
        certificate,
        interaction,
        flags,
        cancellable
      ) =
      (
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withPtr false
         &&&> GioTlsInteractionClass.FFI.withOptPtr false
         &&&> GioTlsDatabaseLookupFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
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
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateClass.FFI.fromPtr true
      )
        lookupCertificateIssuerFinish_
        (
          self
           & result
           & []
        )
    fun verifyChain
      self
      (
        chain,
        purpose,
        identity,
        interaction,
        flags,
        cancellable
      ) =
      (
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioSocketConnectableClass.FFI.withOptPtr false
         &&&> GioTlsInteractionClass.FFI.withOptPtr false
         &&&> GioTlsDatabaseVerifyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateFlags.FFI.fromVal
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
        GioTlsDatabaseClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsCertificateFlags.FFI.fromVal
      )
        verifyChainFinish_
        (
          self
           & result
           & []
        )
  end
