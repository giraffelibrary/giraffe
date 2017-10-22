signature GIO_TLS_CERTIFICATE =
  sig
    type 'a class
    type tls_certificate_flags_t
    type 'a socket_connectable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newFromFile : string -> base class
    val newFromFiles : string * string -> base class
    val newFromPem : string * LargeInt.int -> base class
    val getIssuer : 'a class -> base class
    val isSame :
      'a class
       -> 'b class
       -> bool
    val verify :
      'a class
       -> 'b socket_connectable_class option * 'c class option
       -> tls_certificate_flags_t
    val certificatePemProp : ('a class, string option, string option) Property.readwrite
    val issuerProp : ('a class, base class option, 'b class option) Property.readwrite
    val privateKeyPemProp : ('a class, string option) Property.writeonly
  end
