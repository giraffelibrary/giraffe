signature GIO_DTLS_CLIENT_CONNECTION =
  sig
    type 'a class
    type 'a datagram_based_class
    type 'a socket_connectable_class
    type tls_certificate_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a datagram_based_class * 'b socket_connectable_class option -> base class
    val getServerIdentity : 'a class -> base socket_connectable_class
    val getValidationFlags : 'a class -> tls_certificate_flags_t
    val setServerIdentity :
      'a class
       -> 'b socket_connectable_class
       -> unit
    val setValidationFlags :
      'a class
       -> tls_certificate_flags_t
       -> unit
    val serverIdentityProp : ('a class, base socket_connectable_class option, 'b socket_connectable_class option) Property.readwrite
    val validationFlagsProp : ('a class, tls_certificate_flags_t, tls_certificate_flags_t) Property.readwrite
  end
