signature GIO_TLS_CLIENT_CONNECTION =
  sig
    type 'a class
    type 'a i_o_stream_class
    type 'a socket_connectable_class
    type tls_certificate_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a i_o_stream_class * 'b socket_connectable_class option -> base i_o_stream_class
    val getServerIdentity : 'a class -> base socket_connectable_class
    val getUseSsl3 : 'a class -> bool
    val getValidationFlags : 'a class -> tls_certificate_flags_t
    val setServerIdentity :
      'a class
       -> 'b socket_connectable_class
       -> unit
    val setUseSsl3 :
      'a class
       -> bool
       -> unit
    val setValidationFlags :
      'a class
       -> tls_certificate_flags_t
       -> unit
    val serverIdentityProp : ('a class, base socket_connectable_class option, 'b socket_connectable_class option) Property.readwrite
    val useSsl3Prop : ('a class, bool, bool) Property.readwrite
    val validationFlagsProp : ('a class, tls_certificate_flags_t, tls_certificate_flags_t) Property.readwrite
  end
