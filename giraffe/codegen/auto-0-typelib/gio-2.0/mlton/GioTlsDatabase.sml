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
    val getType_ = _import "g_tls_database_get_type" : unit -> GObjectType.FFI.val_;
    val createCertificateHandle_ = fn x1 & x2 => (_import "g_tls_database_create_certificate_handle" : GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val lookupCertificateForHandle_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_tls_database_lookup_certificate_for_handle" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioTlsInteractionClass.FFI.opt GioTlsInteractionClass.FFI.p
               * GioTlsDatabaseLookupFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val lookupCertificateForHandleFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_database_lookup_certificate_for_handle_finish" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupCertificateIssuer_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_tls_database_lookup_certificate_issuer" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p
               * GioTlsInteractionClass.FFI.opt GioTlsInteractionClass.FFI.p
               * GioTlsDatabaseLookupFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val lookupCertificateIssuerFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_database_lookup_certificate_issuer_finish" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val verifyChain_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_tls_database_verify_chain" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * GioTlsCertificateClass.FFI.non_opt GioTlsCertificateClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioSocketConnectableClass.FFI.opt GioSocketConnectableClass.FFI.p
               * GioTlsInteractionClass.FFI.opt GioTlsInteractionClass.FFI.p
               * GioTlsDatabaseVerifyFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val verifyChainFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_database_verify_chain_finish" :
              GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsCertificateFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
    fun createCertificateHandle self certificate = (GioTlsDatabaseClass.FFI.withPtr &&&> GioTlsCertificateClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) createCertificateHandle_ (self & certificate)
    fun lookupCertificateForHandle
      self
      (
        handle',
        interaction,
        flags,
        cancellable
      ) =
      (
        GioTlsDatabaseClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioTlsInteractionClass.FFI.withOptPtr
         &&&> GioTlsDatabaseLookupFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioTlsDatabaseClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GioTlsDatabaseClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withPtr
         &&&> GioTlsInteractionClass.FFI.withOptPtr
         &&&> GioTlsDatabaseLookupFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioTlsDatabaseClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GioTlsDatabaseClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withOptPtr
         &&&> GioTlsInteractionClass.FFI.withOptPtr
         &&&> GioTlsDatabaseVerifyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioTlsDatabaseClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
