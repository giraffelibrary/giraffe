signature GIO_TLS_INTERACTION =
  sig
    type 'a class_t
    type 'a async_result_class_t
    type tls_interaction_result_t
    type 'a cancellable_class_t
    type 'a tls_password_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val askPassword :
      'a class_t
       -> 'b tls_password_class_t
       -> 'c cancellable_class_t option
       -> tls_interaction_result_t
    val askPasswordFinish :
      'a class_t
       -> 'b async_result_class_t
       -> tls_interaction_result_t
    val invokeAskPassword :
      'a class_t
       -> 'b tls_password_class_t
       -> 'c cancellable_class_t option
       -> tls_interaction_result_t
  end
