signature GIO_TLS_CLIENT_CONNECTION =
  sig
    type 'a class_t
    type 'a i_o_stream_class_t
    type 'a socket_connectable_class_t
    type tls_certificate_flags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a i_o_stream_class_t
       -> 'b socket_connectable_class_t option
       -> base i_o_stream_class_t
    val getServerIdentity : 'a class_t -> base socket_connectable_class_t
    val getUseSsl3 : 'a class_t -> bool
    val getValidationFlags : 'a class_t -> tls_certificate_flags_t
    val setServerIdentity :
      'a class_t
       -> 'b socket_connectable_class_t
       -> unit
    val setUseSsl3 :
      'a class_t
       -> bool
       -> unit
    val setValidationFlags :
      'a class_t
       -> tls_certificate_flags_t
       -> unit
    val serverIdentityProp : ('a class_t, base socket_connectable_class_t option, 'b socket_connectable_class_t option) Property.readwrite
    val useSsl3Prop : ('a class_t, bool, bool) Property.readwrite
    val validationFlagsProp : ('a class_t, tls_certificate_flags_t, tls_certificate_flags_t) Property.readwrite
  end
