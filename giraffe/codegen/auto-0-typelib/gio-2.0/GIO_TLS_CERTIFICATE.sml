signature GIO_TLS_CERTIFICATE =
  sig
    type 'a class_t
    type tlscertificateflags_t
    type 'a socketconnectableclass_t
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
       -> 'b socketconnectableclass_t option
       -> 'c class_t option
       -> tlscertificateflags_t
    val certificatePemProp : ('a class_t, string option, string option) Property.readwrite
    val issuerProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val privateKeyPemProp : ('a class_t, string option) Property.writeonly
  end
