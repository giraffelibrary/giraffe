signature GIO_TLS_SERVER_CONNECTION =
  sig
    type 'a class_t
    type 'a tls_certificate_class_t
    type 'a i_o_stream_class_t
    type tls_authentication_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a i_o_stream_class_t
       -> 'b tls_certificate_class_t option
       -> base i_o_stream_class_t
    val authenticationModeProp : ('a class_t, tls_authentication_mode_t, tls_authentication_mode_t) Property.readwrite
  end
