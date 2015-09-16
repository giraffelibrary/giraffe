structure GioTlsDatabase :>
  GIO_TLS_DATABASE
    where type 'a class_t = 'a GioTlsDatabaseClass.t
    where type tls_database_lookup_flags_t = GioTlsDatabaseLookupFlags.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type tls_database_verify_flags_t = GioTlsDatabaseVerifyFlags.t
    where type 'a tls_interaction_class_t = 'a GioTlsInteractionClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type 'a tls_certificate_class_t = 'a GioTlsCertificateClass.t
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_tls_database_get_type" : unit -> GObjectType.C.val_;
    val createCertificateHandle_ = fn x1 & x2 => (_import "g_tls_database_create_certificate_handle" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
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
               * cstring
               * unit CPointer.t
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
               * cstring
               * unit CPointer.t
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
    type 'a class_t = 'a GioTlsDatabaseClass.t
    type tls_database_lookup_flags_t = GioTlsDatabaseLookupFlags.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type tls_database_verify_flags_t = GioTlsDatabaseVerifyFlags.t
    type 'a tls_interaction_class_t = 'a GioTlsInteractionClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type 'a tls_certificate_class_t = 'a GioTlsCertificateClass.t
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createCertificateHandle self certificate = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) createCertificateHandle_ (self & certificate)
    fun lookupCertificateForHandle self handle' interaction flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GioTlsDatabaseLookupFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GioTlsDatabaseVerifyFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> GioTlsCertificateFlags.C.fromVal
      )
        verifyChainFinish_
        (
          self
           & result
           & []
        )
  end
