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
    val getType_ = _import "g_tls_database_get_type" : unit -> GObjectType.C.val_;
    val createCertificateHandle_ = fn x1 & x2 => (_import "g_tls_database_create_certificate_handle" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * GioTlsDatabaseLookupFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * GioTlsDatabaseLookupFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * GioTlsDatabaseVerifyFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioTlsCertificateFlags.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioTlsCertificateFlags.C.val_;
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
