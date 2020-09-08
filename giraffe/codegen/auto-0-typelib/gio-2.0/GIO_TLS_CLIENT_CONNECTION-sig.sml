signature GIO_TLS_CLIENT_CONNECTION =
  sig
    type 'a class
    type 'a i_o_stream_class
    type 'a socket_connectable_class
    type tls_certificate_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a i_o_stream_class * 'b socket_connectable_class option -> base class
    val copySessionState :
      'a class
       -> 'b class
       -> unit
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
    val serverIdentityProp : ('a class, unit -> base socket_connectable_class option, 'b socket_connectable_class option -> unit, 'b socket_connectable_class option -> unit) Property.t
    val useSsl3Prop : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val validationFlagsProp : ('a class, unit -> tls_certificate_flags_t, tls_certificate_flags_t -> unit, tls_certificate_flags_t -> unit) Property.t
  end
