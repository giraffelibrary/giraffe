signature GIO_TLS_CERTIFICATE =
  sig
    type 'a class_t
    type tls_certificate_flags_t
    type 'a socket_connectable_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val newFromFile : string -> base class_t
    val newFromFiles :
      string
       -> string
       -> base class_t
    val newFromPem :
      string
       -> LargeInt.int
       -> base class_t
    val getIssuer : 'a class_t -> base class_t
    val verify :
      'a class_t
       -> 'b socket_connectable_class_t option
       -> 'c class_t option
       -> tls_certificate_flags_t
    val certificatePemProp : ('a class_t, string option, string option) Property.readwrite
    val issuerProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val privateKeyPemProp : ('a class_t, string option) Property.writeonly
  end
