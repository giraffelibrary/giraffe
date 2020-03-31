signature GIO_TLS_CERTIFICATE =
  sig
    type 'a class
    type tls_certificate_flags_t
    type 'a socket_connectable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newFromFile : string -> base class
    val newFromFiles : string * string -> base class
    val newFromPem : string * int -> base class
    val getIssuer : 'a class -> base class
    val isSame :
      'a class
       -> 'b class
       -> bool
    val verify :
      'a class
       -> 'b socket_connectable_class option * 'c class option
       -> tls_certificate_flags_t
    val certificatePemProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val issuerProp :
      {
        get : 'a class -> base class option,
        new : 'b class option -> 'a class Property.t
      }
    val privateKeyPemProp : {new : string option -> 'a class Property.t}
  end
