signature GIO_TLS_INTERACTION =
  sig
    type 'a class
    type 'a async_result_class
    type tls_interaction_result_t
    type 'a cancellable_class
    type 'a tls_password_class
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
  end
