signature GIO_TLS_SERVER_CONNECTION =
  sig
    type 'a class
    type 'a tls_certificate_class
    type 'a i_o_stream_class
    type tls_authentication_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a i_o_stream_class * 'b tls_certificate_class option -> base class
    val authenticationModeProp :
      {
        get : 'a class -> tls_authentication_mode_t,
        set :
          tls_authentication_mode_t
           -> 'a class
           -> unit,
        new : tls_authentication_mode_t -> 'a class Property.t
      }
  end
