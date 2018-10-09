signature GIO_TLS_DATABASE =
  sig
    type 'a class
    type tls_database_lookup_flags_t
    type 'a cancellable_class
    type tls_database_verify_flags_t
    type 'a tls_interaction_class
    type 'a socket_connectable_class
    type 'a tls_certificate_class
    type tls_certificate_flags_t
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createCertificateHandle :
      'a class
       -> 'b tls_certificate_class
       -> string option
    val lookupCertificateForHandle :
      'a class
       -> string
           * 'b tls_interaction_class option
           * tls_database_lookup_flags_t
           * 'c cancellable_class option
       -> base tls_certificate_class option
    val lookupCertificateForHandleFinish :
      'a class
       -> 'b async_result_class
       -> base tls_certificate_class
    val lookupCertificateIssuer :
      'a class
       -> 'b tls_certificate_class
           * 'c tls_interaction_class option
           * tls_database_lookup_flags_t
           * 'd cancellable_class option
       -> base tls_certificate_class
    val lookupCertificateIssuerFinish :
      'a class
       -> 'b async_result_class
       -> base tls_certificate_class
    val verifyChain :
      'a class
       -> 'b tls_certificate_class
           * string
           * 'c socket_connectable_class option
           * 'd tls_interaction_class option
           * tls_database_verify_flags_t
           * 'e cancellable_class option
       -> tls_certificate_flags_t
    val verifyChainFinish :
      'a class
       -> 'b async_result_class
       -> tls_certificate_flags_t
  end
