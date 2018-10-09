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
    val serverIdentityProp :
      {
        get : 'a class -> base socket_connectable_class option,
        set :
          'b socket_connectable_class option
           -> 'a class
           -> unit,
        new : 'b socket_connectable_class option -> 'a class Property.t
      }
    val validationFlagsProp :
      {
        get : 'a class -> tls_certificate_flags_t,
        set :
          tls_certificate_flags_t
           -> 'a class
           -> unit,
        new : tls_certificate_flags_t -> 'a class Property.t
      }
  end
