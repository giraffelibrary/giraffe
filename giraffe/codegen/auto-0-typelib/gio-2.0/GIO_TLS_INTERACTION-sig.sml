signature GIO_TLS_INTERACTION =
  sig
    type 'a class
    type 'a tls_password_class
    type 'a cancellable_class
    type tls_certificate_request_flags_t
    type 'a tls_connection_class
    type tls_interaction_result_t
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val askPassword :
      'a class
       -> 'b tls_password_class * 'c cancellable_class option
       -> tls_interaction_result_t
    val askPasswordFinish :
      'a class
       -> 'b async_result_class
       -> tls_interaction_result_t
    val invokeAskPassword :
      'a class
       -> 'b tls_password_class * 'c cancellable_class option
       -> tls_interaction_result_t
    val invokeRequestCertificate :
      'a class
       -> 'b tls_connection_class
           * tls_certificate_request_flags_t
           * 'c cancellable_class option
       -> tls_interaction_result_t
    val requestCertificate :
      'a class
       -> 'b tls_connection_class
           * tls_certificate_request_flags_t
           * 'c cancellable_class option
       -> tls_interaction_result_t
    val requestCertificateFinish :
      'a class
       -> 'b async_result_class
       -> tls_interaction_result_t
  end
