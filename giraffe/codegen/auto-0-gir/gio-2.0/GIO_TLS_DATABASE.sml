signature GIO_TLS_DATABASE =
  sig
    type 'a class_t
    type tls_database_lookup_flags_t
    type 'a cancellable_class_t
    type tls_database_verify_flags_t
    type 'a tls_interaction_class_t
    type 'a socket_connectable_class_t
    type 'a tls_certificate_class_t
    type tls_certificate_flags_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val createCertificateHandle :
      'a class_t
       -> 'b tls_certificate_class_t
       -> string
    val lookupCertificateForHandle :
      'a class_t
       -> string
       -> 'b tls_interaction_class_t option
       -> tls_database_lookup_flags_t
       -> 'c cancellable_class_t option
       -> base tls_certificate_class_t
    val lookupCertificateForHandleFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base tls_certificate_class_t
    val lookupCertificateIssuer :
      'a class_t
       -> 'b tls_certificate_class_t
       -> 'c tls_interaction_class_t option
       -> tls_database_lookup_flags_t
       -> 'd cancellable_class_t option
       -> base tls_certificate_class_t
    val lookupCertificateIssuerFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base tls_certificate_class_t
    val verifyChain :
      'a class_t
       -> 'b tls_certificate_class_t
       -> string
       -> 'c socket_connectable_class_t option
       -> 'd tls_interaction_class_t option
       -> tls_database_verify_flags_t
       -> 'e cancellable_class_t option
       -> tls_certificate_flags_t
    val verifyChainFinish :
      'a class_t
       -> 'b async_result_class_t
       -> tls_certificate_flags_t
  end
